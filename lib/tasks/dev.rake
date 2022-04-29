namespace :dev do
  desc "Junta todas as db"
  task setup: :environment do
    if Rails.env.development?

      show_spinner("fazendo....") {%x(rails db:drop:_unsafe)}
      show_spinner("realizando....") {%x(rails db:create)}
      show_spinner("migrando....") {%x(rails db:migrate)}
      show_spinner("seedando....") {%x(rails db:seed)}
      
    else
        puts "Você não está na área de desenvolvimento"

      end   
    end

  end

  private

  def show_spinner(msg_start,msg_end = "concluído")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start} ", format: :arc)
      spinner.auto_spin
      yield
      spinner.success("( #{msg_end} )")
    
  end
