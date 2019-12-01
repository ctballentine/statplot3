require 'test_helper'

class SmplesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @smple = smples(:one)
  end

  test "should get index" do
    get smples_url
    assert_response :success
  end

  test "should get new" do
    get new_smple_url
    assert_response :success
  end

  test "should create smple" do
    assert_difference('Smple.count') do
      post smples_url, params: { smple: { grp: @smple.grp, par1: @smple.par1, par2: @smple.par2 } }
    end

    assert_redirected_to smple_url(Smple.last)
  end

  test "should show smple" do
    get smple_url(@smple)
    assert_response :success
  end

  test "should get edit" do
    get edit_smple_url(@smple)
    assert_response :success
  end

  test "should update smple" do
    patch smple_url(@smple), params: { smple: { grp: @smple.grp, par1: @smple.par1, par2: @smple.par2 } }
    assert_redirected_to smple_url(@smple)
  end

  test "should destroy smple" do
    assert_difference('Smple.count', -1) do
      delete smple_url(@smple)
    end

    assert_redirected_to smples_url
  end
end
