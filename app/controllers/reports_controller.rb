class ReportsController < ApplicationController
    def export
        #https://wkhtmltopdf.org/downloads.html

        # rails g wicked_pdf

        # config/initializers/wicked_pdf.rb
        # WickedPdf.config = { 
        # 	exe_path: 'C:\Program Files\wkhtmltopdf\bin\wkhtmltopdf.exe' 
        # }

        # config/initializers/mime_types.rb
        # Mime::Type.register "application/pdf", :pdf		
        @nombre = session[:user] << " " <<  session[:userA]
        
        @id = session[:datos]["id"]
        @salario = session[:datos]["salario"]
        @fechaIngreso = session[:datos]["fecha_ingreso"]
        @fechaRetiro = session[:datos]["fecha_retiro"]
        @cargo = session[:datos]["cargo"]
        @nombreUs = session[:datos]["nombre"]

      
        
        render template: 'users/reporte',pdf: 'Reporte',layout: 'pdf.html'
    end
end

   #session[:datos]["id"]
     #session[:datos]["cargo"]