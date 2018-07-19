# class CompanyController < ApplicationController
#     def index
#         render "Index"
#     end
  
#         def nav
#             redirect_to :controller => 'document_types', :action => 'index' 
#         end
#         def save
#             mensaje = ''
            
#             if params[:txtId].strip.empty? 
#                 mensaje += 'Ingrese id,'
#             end
#             if params[:txtPrimerNombre].strip.empty? 
#                 mensaje += 'Ingrese primer nombre,'
#             end		
#             if params[:txtPrimerApellido].strip.empty? 
#                 mensaje += 'Ingrese primer apellido,'
#             end
#             if params[:txtSegundoApellido].strip.empty? 
#                 mensaje += 'Ingrese segundo apellido,'
#             end
#             if params[:ddlTipoDocumento].empty? 
#                 mensaje += 'Seleccione tipo documento,'
#             end
            
#             if !mensaje.eql?('')
#                 mensaje = mensaje.slice 0..-2
#                 get_message mensaje,'error'
#                 get_employees
#                 render 'index'
#                 return
#             end
            
#             if params[:btnGuardar] != nil
#                 employee = Employee.new 	
#                 employee.id = params[:txtId]			
#             elsif params[:btnModificar] != nil
#                 get_employee true 
#             end		
            
#             employee.primer_nombre = params[:txtPrimerNombre]
#             employee.segundo_nombre = params[:txtSegundoNombre]
#             employee.primer_apellido = params[:txtPrimerApellido]
#             employee.segundo_apellido = params[:txtSegundoApellido]
#             employee.tipodocumento_id = params[:ddlTipoDocumento]
            
#             if employee.save
#                 get_message 'Se realizo proceso con exito','success'
#             else 
#                 get_message 'Se presento un error durante el procedimiento','error'
#             end
            
#             get_employees
#             render 'index'
#         end
#         def edit	
#             get_employee false
#             get_employees
#             render 'index'
#         end
#         def delete
#             get_employee false
#             if @employee.destroy
#                 get_message 'Se realizo proceso con exito','success'
#             else
#                 get_message 'Se presento un error durante el procedimiento','error'
#             end
            
#             @employee = nil
#             get_employees
#             render 'index'
#         end
#         private 
#         def get_employees
#             @employees = Employee.select('tbE.id,primer_nombre,segundo_nombre,primer_apellido,segundo_apellido,tipodocumento_id,tbTD.descripcion').joins('tbE JOIN "General"."TipoDocumento" tbTD ON tbE.tipodocumento_id = tbTD.id')
#         end
#         def get_employee update
#             if update 
#                 return Employee.find_by(:id=>params[:id])
#             else
#                 @employee = Employee.find_by(:id=>params[:id])
#             end
#         end
#         def get_message message,type
#             @message = message
#             @type = type
#         end
#     end
# end
