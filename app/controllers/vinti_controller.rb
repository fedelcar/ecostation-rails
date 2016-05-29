require 'httparty'

class VintiController < ApplicationController

  def index
    @vinti = nil
    @money = current_user.bottles_in_money
  end

  def create
    vinti_user = params[:user]
    # vinti_user.chomp!('')
    # vinti_user.chomp!('@')
    if vinti_user.blank?
      flash[:error] = 'Completá el nombre de usuario sin arrobas'
      redirect_to :payments_vinti
      return
    end

    if current_user.bottles_in_money.to_i == 0
      flash[:error] = 'No tienes saldo! Andá a reciclar'
      redirect_to :payments_vinti
      return
    end

    money = current_user.bottles_in_money

    # ACA HAY QUE SACAR EL TOTAL DE LAS BOTELLAS! Si todo va bien, pegarle a vinti. Si vinti falla, regargarle/rollback de las botellas.

    result = send_money(vinti_user, money)

    if result.is_a? String
      flash[:error] = result
      redirect_to :payments_vinti
      return
    else
      flash[:notice] = "Se le ha acreditado $#{current_user.bottles_in_money} a la cuenta #{vinti_user}."
      current_user.update_attributes(bottles: 0)
      redirect_to :prizes_path
      return
    end
  end

  private

  def send_money(user, money)
    # En vez de mandar el total, hay que mandar el numero en centavos.
    # Lo correcto seria hacer: 
    # cents = (money * 100).to_i
    # Pero para que no se me acabe la guita, dejo cents en 1.
    
    # Antes del pitch dejar esta linea:
    #cents = money.to_i
    
    # Y comentar la siguiente
    cents = 1

    response = HTTParty.post('https://api.pagaconchip.com/alan/pay', headers: {'Content-Type' => 'application/x-www-form-urlencoded'},  body: {target_username: user, note: 'Gracias por usar EcoStation', amount: cents} )

    if response.code == 200
      return true
    elsif response.code == 404 
      return 'No se ha encontrado al usuario. Por favor ingrese un usuario valido.'
    else
      return 'Hubo un problema. Por favor intente nuevamente en unos instantes'
    end
  end

end

