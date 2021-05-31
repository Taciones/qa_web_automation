require "report_builder"
require "date"

Before do
    @home_page = HomePage.new
    @unidades_page = UnidadesPage.new
    #@movie_page = MoviePage.new
    #@sidebar = SideBarView.new
    #Abaixo para maximizar sempre a tela antes dos testes.
    #page.driver.browser.manage.window.maximize
    page.current_window.resize_to(1440,900)
end


# Before("@login") do
#     user = CONFIG["users"]["cat_manager"]
#     @login_page.go
#     @login_page.with(user["email"], user["pass"])

# end
After do |scenario|
    add_screenshot(scenario)

    if scenario.failed?
        add_browser_logs
    end
end



def add_screenshot(scenario)
    nome_cenario = scenario.name.gsub(/[^A-Za-z0-9]/, '')
    nome_cenario = nome_cenario.gsub(' ','_').downcase!
    screenshot = "log/screenshots/#{nome_cenario}.png"
    page.save_screenshot(screenshot)
    #embed(screenshot, 'image/png', 'Print')
 end


def add_browser_logs
    time_now = Time.now
    # Getting current URL
    current_url = Capybara.current_url.to_s
    # Gather browser logs
    logs = page.driver.browser.manage.logs.get(:browser).map {|line| [line.level, line.message]}
   # Remove warnings and info messages
    logs.reject! { |line| ['WARNING', 'INFO'].include?(line.first) }
    logs.any? == true
    #embed(time_now.strftime('%Y-%m-%d-%H-%M-%S' + "\n") + ( "Current URL: " + current_url + "\n") + logs.join("\n"), 'text/plain', 'BROWSER ERROR')
end

# After do |scenario|
#     if scenario.failed?
#         temp_shot = page.save_screenshot("log/temp_shot.png")
#         screenshot = Base64.encode64(File.open(temp_shot, "rb").read)
#         #embed(screenshot, "image/png", "Screenshot")
#     end
# end


 d = DateTime.now
 @current_date = d.to_s.tr(":", "-")

at_exit do
    ReportBuilder.configure do |config|
        config.input_path = "log/report.json"
        config.report_path = "log/" + @current_date
        config.report_types = [:html]
        config.report_title = "Fleury Automated tests Web Report"
        config.compress_image = true
        config.additional_info = {"App" => "Web", "Data de execução" => @current_date}
        config.color = "indigo"
    end
    ReportBuilder.build_report
end