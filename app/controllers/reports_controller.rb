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
        @idEmpresa = session[:datos]["nit"]
        
        @dias = session[:datosNomina][0]["dias_laborados"]
        @NetoPago = session[:datosNomina][0]["neto_pagado"]
        @comisiones = session[:datosNomina][0]["comisiones"]
        @AuxTrasporte = session[:datosNomina][0]["auxilio_trasporte"]
        @recargos = session[:datosNomina][0]["recargos"]
        @prima = session[:datosNomina][0]["prima"]
        @NetoPago = session[:datosNomina][0]["prestamos"]
        @salud = session[:datosNomina][0]["salud"]
        @pension = session[:datosNomina][0]["pension"]
        render template: 'users/paysheet',pdf: 'Nomina',layout: 'pdf.html'
    end 

end

#N.dias_laborados, N.neto_pagado, N.id, N.comisiones, N.auxilio_trasporte, N.recargos,N.prima, N.prestamos, N.salud, N.pension