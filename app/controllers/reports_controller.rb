class ReportsController < ApplicationController
    def export
        #contolador de PDF
        #https://wkhtmltopdf.org/downloads.html

        # rails g wicked_pdf

        # config/initializers/wicked_pdf.rb
        # WickedPdf.config = { 
        # 	exe_path: 'C:\Program Files\wkhtmltopdf\bin\wkhtmltopdf.exe' 
        # }

        # config/initializers/mime_types.rb
        # Mime::Type.register "application/pdf", :pdf	
        #Creacion de Carta laboral en formato PDF, datos suministrados por la consulta es el controlador Users	
        @nombre = session[:nombre] 
        @apellido= session[:apellido]
        
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
#creacion de Desprendible de pago formato PDF, datos suministrados por la consulta es el controlador Users	
    def paysheet
        @nombreUs = session[:datos]["nombre"]
        @idEmpresa = session[:datos]["id"]
        @nombre = session[:nombre] 
        @apellido= session[:apellido]
        @id = session[:datos]["id"]
        @cargo = session[:datos]["cargo"]
        @nomEmpresa = session[:datos]["nit"]
        
        @dias = session[:datosNomina][0]["dias_laborados"]
        @NetoPago = session[:datosNomina][0]["neto_pagado"]
        @comisiones = session[:datosNomina][0]["comisiones"]
        @AuxTrasporte = session[:datosNomina][0]["auxilio_trasporte"]
        @recargos = session[:datosNomina][0]["recargos"]
        @prima = session[:datosNomina][0]["prima"]
        @prestamos = session[:datosNomina][0]["prestamos"]
        @salud = session[:datosNomina][0]["salud"]
        @pension = session[:datosNomina][0]["pension"]

        @total=@NetoPago +  @comisiones +  @recargos + @prima
        @descuentos = @salud + @pension
        @totalDevengo = @NetoPago + @AuxTrasporte
        @netoPagar = @totalDevengo - @descuentos
        render template: 'users/paysheet',pdf: 'Nomina',layout: 'pdf.html'
    end 

end

