require 'test_helper'

class PaysheetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @paysheet = paysheets(:one)
  end

  test "should get index" do
    get paysheets_url
    assert_response :success
  end

  test "should get new" do
    get new_paysheet_url
    assert_response :success
  end

  test "should create paysheet" do
    assert_difference('Paysheet.count') do
      post paysheets_url, params: { paysheet: { auxilio_trasporte: @paysheet.auxilio_trasporte, comisiones: @paysheet.comisiones, dias_laborados: @paysheet.dias_laborados, id: @paysheet.id, neto_pagado: @paysheet.neto_pagado, pension: @paysheet.pension, prestamos: @paysheet.prestamos, prima: @paysheet.prima, recargos: @paysheet.recargos, salud: @paysheet.salud } }
    end

    assert_redirected_to paysheet_url(Paysheet.last)
  end

  test "should show paysheet" do
    get paysheet_url(@paysheet)
    assert_response :success
  end

  test "should get edit" do
    get edit_paysheet_url(@paysheet)
    assert_response :success
  end

  test "should update paysheet" do
    patch paysheet_url(@paysheet), params: { paysheet: { auxilio_trasporte: @paysheet.auxilio_trasporte, comisiones: @paysheet.comisiones, dias_laborados: @paysheet.dias_laborados, id: @paysheet.id, neto_pagado: @paysheet.neto_pagado, pension: @paysheet.pension, prestamos: @paysheet.prestamos, prima: @paysheet.prima, recargos: @paysheet.recargos, salud: @paysheet.salud } }
    assert_redirected_to paysheet_url(@paysheet)
  end

  test "should destroy paysheet" do
    assert_difference('Paysheet.count', -1) do
      delete paysheet_url(@paysheet)
    end

    assert_redirected_to paysheets_url
  end
end
