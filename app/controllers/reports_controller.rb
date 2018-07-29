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
        @tipoContrato = session[:datos]["tipo_contrato"]
        @idEmpresa = session[:datos]["idEmpresa"]
     
        render template: 'users/reporte',pdf: 'Reporte',layout: 'pdf.html'
    end

    def paysheet
        @nombreUs = session[:datos]["nombre"]
        @idEmpresa = session[:datos]["id"]
        @nombre = session[:user] << " " <<  session[:userA]
        @id = session[:datos]["id"]
        @cargo = session[:datos]["cargo"]
        render template: 'users/paysheet',pdf: 'Nomina',layout: 'pdf.html'
    end 

end

 