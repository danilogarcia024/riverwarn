#encoding: utf-8
class Alert < ActiveRecord::Base
  validates :river_level, presence: true, inclusion: {in: (1..10)}

  after_initialize :set_default_message

  private
  def set_default_message
  	if self.river_level
	   	if self.river_level >= 9 && self.river_level <= 9.25
	  		self.message = "ALERTA: Nivel de río elevado"
	  	else
	  		if self.river_level >= 9.26 && self.river_level <= 9.50
	  			self.message = "ALERTA NARANJA: Nivel de río elevado, muy cerca de desborde, prepare PLAN DE EMERGENCIA Y DE AVISO A LAS AUTORIDADES Y CIUDADANIA"
			else
				if self.river_level >= 9.51 && self.river_level <= 9.75
					self.message = "ALERTA ROJA: Nivel de río muy elevado: INUNDACION INMINENTE!!!!, INICIE PLAN DE EVACUACION Y DE EMERGENCIAS, DE AVISO A LAS AUTORIDADES Y SOLICITE PERSONAL DE APOYO."
				else
					if self.river_level >= 9.76
						self.message = "INUNDACION: río DESBORDADO: TOME MEDIDAS DE ATENCION DE PERSONAS, PLAN DE ATENCION DE VICTIMAS"
					else
						self.message = "ESTADO NORMAL"
					end
				end
			end
		end
  	end
  end
end
