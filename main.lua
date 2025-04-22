--- STEAMODDED HEADER
--- MOD_NAME: El Balto
--- MOD_ID: idk
--- MOD_AUTHOR: [Mandrix]
--- MOD_DESCRIPTION: si lees esto tu album favorito es Graduation de Kanye West
--- BADGE_COLOUR: A67C00
--- PREFIX: idk
--- DEPENDENCIES: [Steamodded>=1.0.0~ALPHA-0812d] [Talisman]
SMODS.Atlas{
    key = 'jokers',
    path = 'jokers.png',
    px = 71,
    py = 95 
}
SMODS.Atlas{
    key = 'enhancements',
    path = 'placeholders.png',
    px = 71,
    py = 95 
}
SMODS.Atlas{
    key = 'vouchers',
    path = 'atlasvoucher.png',
    px = 59,
    py = 93 
}
SMODS.Atlas{
    key = 'consumables',
    path = 'consumables.png',
    px = 142,
    py = 190
}
SMODS.current_mod.optional_features = {
    -- enable additional SMODS contexts that can be CPU intensive
    retrigger_joker = true,
}

SMODS.PokerHand {
    key = 'ManoT',
	visible = true,
    chips = 67.4,
    mult = 8.6,
    l_chips = 67,
    l_mult = 4,
    example = {
        { 'S_6',    true },
        { 'C_7',    true },
        { 'D_4',    true },
        { 'H_8',    true },
        { 'S_6',    true },
    },
    loc_txt = {
        ['es_ES'] = {
            name = 'Mano de Estaño-Roble',
            description = {
                'tiene que estar en orden sino no furula'
            }
        },
        ['default'] = {
            name = 'Hand of the Tin-Oak',
            description = {
                'order is important.'
            }
        }
    },
	evaluate = function(parts, hand)
		if hand == nil then 
			return {} 
		end
		if #hand ~= 5 then 
			return {} 
		end
		local _tick = 0
		if hand[1]:get_id()==6 then
			_tick = _tick + 1
		end
		if hand[2]:get_id()==7 then
			_tick = _tick + 1
		end
		if hand[3]:get_id()==4 then
        _tick = _tick + 1
		end
		if hand[4]:get_id()==8 then
        _tick = _tick + 1
		end
		if hand[5]:get_id()==6 then
			_tick = _tick + 1
		end
		if _tick == 5 then
			return {hand}
		end
	end
}

SMODS.Consumable {
    set = 'Planet',
    key = 'seissietecuatro',
    --! `h_` prefix was removed
    config = { hand_type = 'idk_ManoT' },
    pos = {x = 2, y = 0 },
    atlas = 'consumables',
    set_card_type_badge = function(self, card, badges)
        badges[1] = create_badge(localize('k_planet_q'), get_type_colour(self or card.config, card), nil, 1.2)
    end,
    process_loc_text = function(self)
        --use another planet's loc txt instead
        local target_text = G.localization.descriptions[self.set]['c_mercury'].text
        SMODS.Consumable.process_loc_text(self)
        G.localization.descriptions[self.set][self.key].text = target_text
    end,
    generate_ui = 0,
    loc_txt = {
        ['en-us'] = {
                name="PEACE!",
                text={
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#",
                    "{C:mult}+#3#{} Mult and",
                    "{C:chips}+#4#{} peaceful chips",
                },
        },
		['es_ES'] = {
                name="PAZ!",
                text={
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} sube de nivel",
                    "{C:attention}#2#",
                    "{C:mult}+#3#{} Multi and",
                    "{C:chips}+#4#{} fichas pacíficas",
                },
        }
    }
}
SMODS.PokerHand {
    key = 'ManoAz',
	visible = false,
    chips = 903,
    mult = 93,
    l_chips = 90,
    l_mult = 93,
    example = {
        { 'S_4',    true },
        { 'H_K',    true },
        { 'D_7',    true },
        { 'D_3',    true },
        { 'C_Q',    true },
    },
    loc_txt = {
        ['es_ES'] = {
            name = 'Mano de Az promedio',
            description = {
                'la mano main del blud'
            }
        },
        ['en-us'] = {
            name = 'Azs Average Hand',
            description = {
                'the main hand of the blud'
            }
        }
    },
	evaluate = function(parts, hand)
		if hand == nil then 
			return {} 
		end
		if #hand ~= 5 then 
			return {} 
		end
		local _tick = 0
		if hand[1]:is_suit("Spades") and hand[1]:get_id()==4 then
			_tick = _tick + 1
		end
		if hand[2]:is_suit("Hearts") and hand[2]:get_id()==13 then
			_tick = _tick + 1
		end
		if hand[3]:is_suit("Diamonds") and hand[3]:get_id()==7 then
        _tick = _tick + 1
		end
		if hand[4]:is_suit("Diamonds") and hand[4]:get_id()==3 then
        _tick = _tick + 1
		end
		if hand[5]:is_suit("Clubs") and hand[5]:get_id()==12 then
			_tick = _tick + 1
		end
		if _tick == 5 then
			return {hand}
		end
	end
}
SMODS.Joker {
  key = 'no_joker',
  loc_txt = {
	['en-us'] = {
		name = 'No',
		text = {
		"Create a negative Wheel of Fortune",
		"at the end of every {C:attention}shop"
		}
	},
		['es_ES'] = {
		name = 'No',
		text = {
			"Crea una rueda de la fortuna negativa",
			"al final de cada {C:attention}tienda"
		}
	}
  },
  -- Extra is empty, because it only happens once. If you wanted to copy multiple cards, you'd need to restructure the code and add a for loop or something.
  config = { extra = {} },
  rarity = 1,
  blueprint_compat = true, --can it be blueprinted/brainstormed/other
  eternal_compat = true, --can it be eternal
  perishable_compat = true, --can it be perishable
  atlas = 'jokers',
  pos = { x = 0, y = 0 },
  -- soul_pos sets the soul sprite, only used in vanilla for legenedaries and Hologram.
  cost = 4,
  calculate = function(self, card, context)
    if context.ending_shop then
      G.E_MANAGER:add_event(Event({
        func = function()
			SMODS.add_card({set = 'Tarot', area = G.consumeables, key = 'c_wheel_of_fortune', edition = "e_negative"})
			return true
        end
      }))
    end
  end
}
SMODS.Joker {
  key = 'fallocardiaco',
  loc_txt = {
	['en-us'] = {
		name = 'Heart Attack',
		text = {
		"Random mult. (Fuck around and find out)"
		}
	},
	['es_ES'] = {
		name = 'Fallo cardiaco',
		text = {
		"Multi random. (El culio)"
		}
	}
  },
  config = { extra = { 
    mult_min = -1000,
    mult_max = 1000,
	odds = 3
  } },
  rarity = 'idk_locuron',
  atlas = 'jokers',
  pos = { x = 5, y = 0 },
  cost = 3,
  blueprint_compat = true,
  loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult } }
  end,
	calculate = function(self, card, context)
		if context.joker_main then
			local mult_min = card.ability.extra.mult_min
			local mult_max = card.ability.extra.mult_max
			card.ability.extra.mult = math.random(mult_min, mult_max)
		    return {
				mult_mod = card.ability.extra.mult,
				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
			}
		end
		if context.selling_self and not context.blueprint then
		    if pseudorandom('fallocardiaco') < G.GAME.probabilities.normal / card.ability.extra.odds then
				G.E_MANAGER:add_event(Event({
					func = function()
						SMODS.add_card({set = 'Joker', area = G.jokers, key = 'j_idk_fallocardiaco2', stickers = { 'eternal' } })
						return true
					end
				}))			
			end
		end
	end
}
SMODS.Joker {
  key = 'fallocardiaco2',
  loc_txt = {
	['en-us'] = {
		name = 'Heart Attack 2',
		text = {
		"god is dead." 
		}
	},
	['es_ES'] = {
		name = 'Fallo cardiaco 2',
		text = {
		"dios ha muerto."
		}
	}
  },
  config = { extra = { 
    Xmult_min = -1000,
    Xmult_max = 1000
  } },
  rarity = 'idk_mierdonhistorico',
  atlas = 'jokers',
  pos = { x = 0, y = 1 },
  cost = 3,
  blueprint_compat = true,
  loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.Xmult } }
  end,
	calculate = function(self, card, context)
		if context.joker_main then
			local Xmult_min = card.ability.extra.Xmult_min
			local Xmult_max = card.ability.extra.Xmult_max
			card.ability.extra.Xmult = math.random(Xmult_min, Xmult_max)
		    return {
				Xmult_mod = card.ability.extra.Xmult,
				message = localize { type = 'variable', key = 'a_Xmult', vars = { card.ability.extra.Xmult } },
				message = 'X' .. card.ability.extra.Xmult,
				colour = G.C.MULT		
			}
		end
	end
}
SMODS.Joker {
  key = 'onmymomma',
  loc_txt = {
	['en-us'] = {
		name = 'ON MY MOMMA',
		text = {
		"Each scored {C:attention}Queen{} grants {X:mult,C:white}X#1#{} mult",
		"{C:green}#2# in #3#{} of {C:attention}WINNING!!1!!!1!{}",
		}
	},
	['es_ES'] = {
		name = 'JURAO JAI',
		text = {
		"Cada {C:attention}Reina{} jugada otorga {X:mult,C:white}X#1#{} multi",
		"{C:green}#2# en #3#{} de {C:attention}	GANAR LA PARTIDA!!1!!!1!{}",
		}
	}
  },
  config = { extra = { Xmult = 4, odds = 10 } },
  rarity = 'idk_locuron',
  atlas = 'jokers',
  pos = { x = 1, y = 2 },
  cost = 3,
  blueprint_compat = true,
  loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.Xmult, (G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
  end,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      -- :get_id tests for the rank of the card. Other than 2-10, Jack is 11, Queen is 12, King is 13, and Ace is 14.
      if context.other_card:get_id() == 12 then
        -- Specifically returning to context.other_card is fine with multiple values in a single return value, chips/mult are different from chip_mod and mult_mod, and automatically come with a message which plays in order of return.
	    if pseudorandom('fallocardiaco') < G.GAME.probabilities.normal / card.ability.extra.odds then
			G.E_MANAGER:add_event(Event({
				func = function()
					SMODS.add_card({set = 'Joker', area = G.jokers, key = 'j_idk_fallocardiaco2', stickers = { 'eternal' } })
					SMODS.add_card({set = 'Joker', area = G.jokers, key = 'j_idk_fallocardiaco2', stickers = { 'eternal' } })
					SMODS.add_card({set = 'Joker', area = G.jokers, key = 'j_idk_fallocardiaco2', stickers = { 'eternal' } })
					SMODS.add_card({set = 'Joker', area = G.jokers, key = 'j_idk_fallocardiaco2', stickers = { 'eternal' } })
					SMODS.add_card({set = 'Joker', area = G.jokers, key = 'j_idk_fallocardiaco2', stickers = { 'eternal' } })
					return true
				end
			}))			
		end
        return {
          Xmult = card.ability.extra.Xmult
        }
      end
    end
  end
}
SMODS.Joker {
  key = 'fastfood',
  loc_txt = {
	['en-us'] = {
		name = 'Fast Food',
		text = {
		"When sold, create a random {C:dark_edition}negative{} {C:attention}Perishable{} {C:mult}Rare{} {C:attention}Joker{}",
		"and two random {C:dark_edition}negative{} {C:chips}common{} {C:attention}Jokers{}",
		"{C:inactive}You really paid 8$ for this?{}"
		}
	},
  	['es_ES'] = {
		name = 'Comida Rápida',
		text = {
		"Al vender este comodín, crea un {C:attention}comodín{} {C:dark_edition}negativo{}, {C:attention}perecedero{}, y {C:mult}raro{} aleatorio",
		"y crea dos {C:attention}comodines{} {C:dark_edition}negativos{} y {C:chips}comunes{} aleatorios",
		"{C:inactive}¿En serio has pagado 8$ por esto?{}"
		}
	}
  },
  rarity = 1,
  atlas = 'jokers',
  pos = { x = 6, y = 1 },
  cost = 8,
  calculate = function(self, card, context)
    if context.selling_self then
		G.E_MANAGER:add_event(Event({
			func = function()
				SMODS.add_card({set = 'Joker', area = G.jokers, rarity = 0.99, edition = 'e_negative', stickers = { 'perishable' } })
				SMODS.add_card({set = 'Joker', area = G.jokers, rarity = 0.5, edition = 'e_negative' })
				SMODS.add_card({set = 'Joker', area = G.jokers, rarity = 0.5, edition = 'e_negative' })
				return true
			end
		}))		
    end
  end
}
SMODS.Joker {
  key = 'ante1joker',
  loc_txt = {
	['en-us'] = {
		name = 'The Ideal Ante 1 Joker.',
		text = {
		"{C:mult}+#1#{} mult."
		}
	},
  	['es_ES'] = {
		name = 'El Joker Ideal De Ronda 1.',
		text = {
		"{C:mult}+#1#{} multi."
		}
	}
  },
  config = { extra = { mult = 12 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult } }
  end,
  rarity = 1,
  atlas = 'jokers',
  pos = { x = 5, y = 1 },
  cost = 4,
  calculate = function(self, card, context)
    if context.joker_main then
      return {
        mult_mod = card.ability.extra.mult,
        message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
      }
    end
  end
}
SMODS.Joker {
  key = 'huh_a_six',
  loc_txt = {
	['en-us'] = {
		name = 'Huh? A six?',
		text = {
		"If you have a 6th {C:attention}Joker{},",
		"retrigger it twice"
		}
	},
  	['es_ES'] = {
		name = 'Que? Un seis?',
		text = {
		"Si tienes un sexto {C:attention}Joker{},",
		"se reactiva dos veces"
		}
	}
  },
  
  unlocked = true,
  config = {  },  
  blueprint_compat = true, --can it be blueprinted/brainstormed/other
  eternal_compat = true, --can it be eternal
  perishable_compat = true, --can it be perishable
  rarity = 1,
  atlas = 'jokers',
  pos = { x = 7, y = 1 },
  cost = 6,
   calculate = function(self, card, context)
		local retrigger_card = G.jokers.cards[6]
		if context.retrigger_joker_check and context.other_card ~= card and context.other_card == retrigger_card then
			return {
				message = localize('k_again_ex'),
				repetitions = 2,
			}
		end
	end
}
SMODS.Joker {
  key = 'yoquesetiocomosepuedellamar',
  loc_txt = {
	['en-us'] = {
		name = 'idk man what can it be?',
		text = {
		"If your hand contains {C:attention}Hand of the Tin-Oak{}:",
		"grants {C:chips}+#1#{} chips."
		}
	},
  	['es_ES'] = {
		name = 'yo que se tio, como se puede llamar?',
		text = {
		"Si tu mano contiene {C:attention}Mano de Estaño-roble{}:",
		"otorga {C:chips}+#1#{} fichas."
		}
	}
  },
  config = { extra = { chips = 120 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chips } }
  end,
  rarity = 1,
   blueprint_compat = true, --can it be blueprinted/brainstormed/other
  eternal_compat = true, --can it be eternal
  perishable_compat = true, --can it be perishable
  atlas = 'jokers',
  pos = { x = 7, y = 2 },
  cost = 3,
  calculate = function(self, card, context)
    if context.joker_main and context.scoring_name == 'idk_ManoT' and not context.blueprint then
      return {
        chips = card.ability.extra.chips
      }
    end
  end
}
SMODS.Joker {
  key = 'sehanllevaoelcoche',
  loc_txt = {
	['en-us'] = {
		name = 'They took the car away',
		text = {
		"{C:mult}+#2#{} mult",
		"If a {C:attention}#1#{} is played, {C:attention}resets the universe{}",
		"{C:inactive}(Hand changes at the end of round){}"
		}
	},
  	['es_ES'] = {
		name = 'Se han llevao el coche',
		text = {
		"{C:mult}+#2#{} multi",
		"Si tu mano jugada es {C:attention}#1#{}, {C:attention}reinicia el universo{}",
		"{C:inactive}(Cambia al final de la ronda){}"
		}
	}
  },
  
  unlocked = true,
  config = { extra = { to_do_poker_hand = 'Straight Flush', mult = 6.9 }  },  
  blueprint_compat = true, --can it be blueprinted/brainstormed/other
  eternal_compat = true, --can it be eternal
  perishable_compat = true, --can it be perishable
  rarity = 1,
  atlas = 'jokers',
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.to_do_poker_hand, card.ability.extra.mult } }
  end,
  pos = { x = 0, y = 3 },
  cost = 6,
   calculate = function(self, card, context)
		if context.end_of_round and context.cardarea == G.jokers then
		    local _poker_hands = {}
                for k, v in pairs(G.GAME.hands) do
					if v.visible and k ~= card.ability.extra.to_do_poker_hand then _poker_hands[#_poker_hands+1] = k end
				end
			card.ability.extra.to_do_poker_hand = pseudorandom_element(_poker_hands, pseudoseed('to_do'))
                return {
                    message = localize('k_reset')
                }
		end
		if context.before and context.cardarea == G.jokers then
			if context.scoring_name == card.ability.extra.to_do_poker_hand and not context.blueprint then
				return {
					SMODS.restart_game()
				}		
			end
		end
		if context.joker_main then
				return {
					mult = card.ability.extra.mult
				}		
		end
	end
}
SMODS.Joker {
  key = 'gambleador',
  loc_txt = {
	['en-us'] = {
		name = 'Gambler',
		text = {
		"gains {C:chips}+#2#{} chips ",
		"when a blind is skipped",
		"(Currently {C:chips}+#1#{} chips)"
		}
	},
	['es_ES'] = {
		name = 'Apostador',
		text = {
		"gana {C:chips}+#2#{} fichas ",
		"al saltar una ciega",
		"(lleva {C:chips}+#1#{} fichas)"
		}
	}
  },
  config = { extra = { chips = 0, chip_gain = 77.7 } },
  rarity = 2,
  unlocked = true, --where it is unlocked or not: if true, 
  blueprint_compat = true, --can it be blueprinted/brainstormed/other
  eternal_compat = true, --can it be eternal
  perishable_compat = true, --can it be perishable  
  atlas = 'jokers',
  pos = { x = 1, y = 1 },
  cost = 5,
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chips, card.ability.extra.chip_gain } }
  end,
  calculate = function(self, card, context)
    if context.joker_main then
      return {
        chip_mod = card.ability.extra.chips,
        message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } },
        message = '+' .. card.ability.extra.chips,
        colour = G.C.CHIPS		
      }
    end

    -- context.before checks if context.before == true, and context.before is true when it's before the current hand is scored.
    -- (context.poker_hands['Straight']) checks if the current hand is a 'Straight'.
    -- The 'next()' part makes sure it goes over every option in the table, which the table is context.poker_hands.
    -- context.poker_hands contains every valid hand type in a played hand.
    -- not context.blueprint ensures that Blueprint or Brainstorm don't copy this upgrading part of the joker, but that it'll still copy the added chips.
    if context.skip_blind and not context.blueprint then
      -- Updated variable is equal to current variable, plus the amount of chips in chip gain.
      -- 15 = 0+15, 30 = 15+15, 75 = 60+15.
      card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_gain
      return {
        message = 'Mejora!',
        colour = G.C.CHIPS,
        -- The return value, "card", is set to the variable "card", which is the joker.
        -- Basically, this tells the return value what it's affecting, which if it's the joker itself, it's usually card.
        -- It can be things like card = context.other_card in some cases, so specifying card (return value) = card (variable from function) is required.
        card = card
      }
    end
  end
}
SMODS.Joker {
  key = 'fibonaccint',
  loc_txt = {
	['en-us'] = {
		name = 'Fibonaccint',
		text = {
		"Every {C:attention}4, 6, 7, 9, 10, J, Q{}, and {C:attention}K{} scored",
		"grants {C:mult}#1#{} mult"
		}
	},
  	['es_ES'] = {
		name = 'Fibonaccint',
		text = {
		"Cada {C:attention}4, 6, 7, 9, 10, J, Q{}, y {C:attention}K{} jugado",
		"otorga {C:mult}+#1#{} multi"
		}
	}
  },
  
  unlocked = true, 
  blueprint_compat = true, --can it be blueprinted/brainstormed/other
  eternal_compat = true, --can it be eternal
  perishable_compat = true, --can it be perishable
  config = { extra = { mult = 6 } },
  rarity = 2,
  atlas = 'jokers',
  pos = { x = 2, y = 1 },
  cost = 6,
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult } }
  end,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      -- :get_id tests for the rank of the card. Other than 2-10, Jack is 11, Queen is 12, King is 13, and Ace is 14.
      if context.other_card:get_id() == 4 or context.other_card:get_id() == 6 or context.other_card:get_id() == 7 or context.other_card:get_id() == 9 or context.other_card:get_id() == 10 or context.other_card:get_id() == 11 or context.other_card:get_id() == 12 or context.other_card:get_id() == 13 then
        -- Specifically returning to context.other_card is fine with multiple values in a single return value, chips/mult are different from chip_mod and mult_mod, and automatically come with a message which plays in order of return.
        return {
          mult = card.ability.extra.mult,
          card = context.other_card
        }
      end
    end
  end
}
SMODS.Joker {
  key = 'ge',
  loc_txt = {
	['en-us'] = {
		name = 'G',
		text = {
		"Every {C:attention}gold card{} in your hand",
		"grants {C:mult}#1#{} mult"
		}
	},
  	['es_ES'] = {
		name = 'G',
		text = {
		"Cada {C:attention}carta dorada{}, en tu mano",
		"otorga {C:mult}+#1#{} multi"
		}
	}
  },
  config = { extra = { mult = 18, gold_count = 0 }},
  rarity = 2,
  atlas = 'jokers',
  pos = { x = 3, y = 1 },
  cost = 6,
  blueprint_compat = true,
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult, card.ability.extra.gold_count } }
  end,
 --thanks BepisFever for basically coding this for me cus im a dummy LMAO
  calculate = function(self, card, context)
      if context.before then
          card.ability.extra.gold_count = 0
          for _,v in ipairs(G.hand.cards) do
             if SMODS.has_enhancement(v, "m_gold") then
                card.ability.extra.gold_count = card.ability.extra.gold_count + 1
             end
          end
      end
      if context.joker_main and context.full_hand == G.play.cards then
          return {
            mult = card.ability.extra.mult*card.ability.extra.gold_count,
            card = context.other_card
          }
      end
  end
}
SMODS.Joker {
  key = 'autismosimulator',
  loc_txt = {
	['en-us'] = {
		name = 'autism simulator',
		text = {
		"If your hand contains {C:attention}Hand of the Tin-Oak{}:",
		"grants {C:mult}+#1#{} mult."
		}
	},
  	['es_ES'] = {
		name = 'simulador de autismo',
		text = {
		"Si tu mano contiene {C:attention}Mano de Estaño-Roble{}:",
		"otorga {C:mult}+#1#{} mult."
		}
	}
  },
  config = { extra = { mult = 101 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult } }
  end,
  rarity = 2,
  atlas = 'jokers',
  blueprint_compat = true,
  pos = { x = 6, y = 2 },
  cost = 5,
  calculate = function(self, card, context)
  if context.joker_main and context.scoring_name == 'idk_ManoT' and not context.blueprint then
      return {
        mult_mod = card.ability.extra.mult,
        message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
      }
    end
  end
}
SMODS.Joker{
    key = 'grindstone',
	loc_txt = {
		['en-us'] = {
			name = 'Grindstone',
			text = {
			"Retrigger each scored {C:attention}Diamond{} card",
			}
		},
		['es_ES'] = {
			name = 'simulador de autismo',
			text = {
			"Reactiva las cartas del palo {C:attention}Diamante{} puntuadas",
			}
		}
	},
    atlas = 'jokers',
    pos = {x = 2, y = 3},
    config = { extra = {
        repetitions = 1
    }},
    
    cost = 7,
    rarity = 2,
    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.repetition then
			if context.other_card:is_suit("Diamonds") then
				return {
					message = localize('k_again_ex'),
					repetitions = card.ability.extra.repetitions,
					card = card
				}
			end
        end
    end
}
SMODS.Joker {
  key = 'ochopuntocinco',
  loc_txt = {
	['en-us'] = {
		name = '8.5 Ball',
		text = {
		"Each scored {C:attention}8{} has a {C:green}#1# in #2#{}",
		"of creating {C;attention}8{} {C:negative}negative{} {C:attention}Tarot Cards{}",
		"{C:inactive}Decimal number, peak comedy.{}"
		}
	},
  	['es_ES'] = {
		name = 'Bola 8.5',
		text = {
		"Cada {C:attention}8{} puntuado tiene {C:green}#1# en #2#{}",
		"de crear {C;attention}8{} {C:attention}Cartas del Tarot{} {C:negative}negativas{}",
		"{C:inactive}Número decimal, el pináculo de la comedia.{}"
		}
	}
  },
  
  unlocked = true, 
  blueprint_compat = true, --can it be blueprinted/brainstormed/other
  eternal_compat = true, --can it be eternal
  perishable_compat = true, --can it be perishable
  config = { extra = { odds = 8 } },
  rarity = 2,
  atlas = 'jokers',
  pos = { x = 6, y = 3 },
  cost = 6,
  loc_vars = function(self, info_queue, card)
  return { vars = { (G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
  end,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      -- :get_id tests for the rank of the card. Other than 2-10, Jack is 11, Queen is 12, King is 13, and Ace is 14.
      if context.other_card:get_id() == 8 then
			if pseudorandom('oingo') < G.GAME.probabilities.normal / card.ability.extra.odds then
        -- Specifically returning to context.other_card is fine with multiple values in a single return value, chips/mult are different from chip_mod and mult_mod, and automatically come with a message which plays in order of return.
				return {
					G.E_MANAGER:add_event(Event({
						func = function()
							SMODS.add_card({set = 'Tarot', area = G.consumeables, edition = "e_negative"})
							SMODS.add_card({set = 'Tarot', area = G.consumeables, edition = "e_negative"})
							SMODS.add_card({set = 'Tarot', area = G.consumeables, edition = "e_negative"})
							SMODS.add_card({set = 'Tarot', area = G.consumeables, edition = "e_negative"})
							SMODS.add_card({set = 'Tarot', area = G.consumeables, edition = "e_negative"})
							SMODS.add_card({set = 'Tarot', area = G.consumeables, edition = "e_negative"})
							SMODS.add_card({set = 'Tarot', area = G.consumeables, edition = "e_negative"})
							SMODS.add_card({set = 'Tarot', area = G.consumeables, edition = "e_negative"})
							return true
						end
					}))
				}
			end
      end
    end
  end
}
SMODS.Joker {
  key = 'vivaelgambling',
  loc_txt = {
	['en-us'] = {
		name = 'LONG LIVE GAMBLING',
		text = {
		"Each scored {C:attention}7{} has a {C:green}#1# in #2#{}",
		"of giving {C:money}#3#{}$"
		}
	},
  	['es_ES'] = {
		name = 'VIVA EL GAMBLING',
		text = {
		"Cada {C:attention}7{} puntuado tiene {C:green}#1# en #2#{}",
		"de otorgar {C:money}#3#{}$"
		}
	}
  },
  
  unlocked = true, 
  blueprint_compat = true, --can it be blueprinted/brainstormed/other
  eternal_compat = true, --can it be eternal
  perishable_compat = true, --can it be perishable
  config = { extra = { odds = 7, money = 7 } },
  rarity = 2,
  atlas = 'jokers',
  pos = { x = 5, y = 3 },
  cost = 6,
  loc_vars = function(self, info_queue, card)
  return { vars = { (G.GAME.probabilities.normal or 1), card.ability.extra.odds, card.ability.extra.money } }
  end,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      -- :get_id tests for the rank of the card. Other than 2-10, Jack is 11, Queen is 12, King is 13, and Ace is 14.
      if context.other_card:get_id() == 7 then
			if pseudorandom('oingo') < G.GAME.probabilities.normal / card.ability.extra.odds then
        -- Specifically returning to context.other_card is fine with multiple values in a single return value, chips/mult are different from chip_mod and mult_mod, and automatically come with a message which plays in order of return.
				return {
					ease_dollars(card.ability.extra.money)
				}
			end
      end
    end
  end
}
SMODS.Joker {
  key = 'hauntedhouse',
  loc_txt = {
	['en-us'] = {
		name = 'Haunted House',
		text = {
		"Playing a {C:attention}Full House{} has a {C:green}#1# in #2#{}",
		"of creating a {C:blue}Spectral{} card"
		}
	},
  	['es_ES'] = {
		name = 'Casa Embrujada',
		text = {
		"Jugar un {C:attention}Full{} tiene un {C:green}#1# en #2#{}:",
		"de crear una Carta {C:blue}Espectral{}"
		}
	}
  },
  config = { extra = { odds = 2 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { (G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
  end,
  rarity = 2,
  atlas = 'jokers',
  blueprint_compat = true,
  pos = { x = 7, y = 3 },
  cost = 6,
  calculate = function(self, card, context)
	if context.joker_main and context.scoring_name == 'Full House' and not context.blueprint then
      return {
				G.E_MANAGER:add_event(Event({
						func = function()
							SMODS.add_card({set = 'Spectral', area = G.consumeables})
							return true
						end
					}))
		}
    end
  end
}
SMODS.Joker {
  key = 'lobotomia',
  loc_txt = {
	['en-us'] = {
		name = 'Lobotomy',
		text = {
		"{C:green}#1# in #2#{} of retriggering",
		"the leftmost joker twice"
		}
	},
  	['es_ES'] = {
		name = 'Lobotomía',
		text = {
		"{C:green}#1# en #2#{} de reactivar",
		"el joker del extremo izquierdo 2 veces"
		}
	}
  },
  
  unlocked = true,
  config = { extra = { odds = 3 } },  
  blueprint_compat = true, --can it be blueprinted/brainstormed/other
  eternal_compat = true, --can it be eternal
  perishable_compat = true, --can it be perishable
  rarity = 3,
  atlas = 'jokers',
  pos = { x = 1, y = 0 },
  cost = 7,
  loc_vars = function(self, info_queue, card)
  return { vars = { (G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
  end,
  --thanks BepisFever for basically coding this for me cus im a dummy LMAO 
   calculate = function(self, card, context)
		local retrigger_card = G.jokers.cards[1]
		if context.retrigger_joker_check and context.other_card ~= card and context.other_card == retrigger_card then
	        if pseudorandom('lobotomia') < G.GAME.probabilities.normal / card.ability.extra.odds then
				return {
					message = localize('k_again_ex'),
					repetitions = 2,
				}
			end
		end
	end
}
SMODS.Joker {
  key = 'baron2',
  loc_txt = {
	['en-us'] = {
		name = 'Rio de Janeiro',
		text = {
		"Adds a Steel King of Hearts to your deck",
		"when selecting a blind,",
		"{C:green}#1# in #2#{} of self-destructing",
		"at the end of every round"
		}
	},
 	['es_ES'] = {
		name = 'Rio de Janeiro',
		text = {
		"Crea un rey de corazones de acero",
		"al seleccionar ciega grande o pequeña",
		"{C:green}#1# en #2#{} de auto-destruirse",
		"al final de cada ronda"
		}
	}
  },
  -- Extra is empty, because it only happens once. If you wanted to copy multiple cards, you'd need to restructure the code and add a for loop or something.
  config = { extra = { odds = 4 } },  
  blueprint_compat = true, --can it be blueprinted/brainstormed/other
  eternal_compat = false, --can it be eternal
  perishable_compat = true, --can it be perishable
  rarity = 3,
  pool = { ["cacapack"] = true },
  atlas = 'jokers',
  pos = { x = 6, y = 0 },
  loc_vars = function(self, info_queue, card)
	return { vars = { (G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
  end,
  -- soul_pos sets the soul sprite, only used in vanilla for legenedaries and Hologram.
  cost = 8,
  calculate = function(self, card, context)
    if context.setting_blind then
      G.E_MANAGER:add_event(Event({
        func = function()
			create_playing_card({front = G.P_CARDS['H_K'], center = G.P_CENTERS['m_steel']}, G.deck, false, false, {G.C.SECONDARY_SET.Spectral})
			return true
        end
      }))
    end
    if context.end_of_round and context.game_over == false and not context.repetition and not context.blueprint then
      if pseudorandom('baron2') < G.GAME.probabilities.normal / card.ability.extra.odds then
        G.E_MANAGER:add_event(Event({
          func = function()
            play_sound('tarot1')
            card.T.r = -0.2
            card:juice_up(0.3, 0.4)
            card.states.drag.is = true
            card.children.center.pinch.x = true
            G.E_MANAGER:add_event(Event({
              trigger = 'after',
              delay = 0.3,
              blockable = false,
              func = function()
                G.jokers:remove_card(card)
                card:remove()
                card = nil
                return true;
              end
            }))
            return true
          end
        }))
        return {
          message = 'RIP BOZO'
        }
      else
        return {
          message = 'GG'
        }
      end
    end
  end
}
SMODS.Joker {
  key = 'capitanbalatro',
  loc_txt = {
	['en-us'] = {
		name = 'captain balatro',
		text = {
		"This joker is straight up broken. Not in an OP way",
		"Its just hell."
		}
	},
	['es_ES'] = {
		name = 'capitan balatro',
		text = {
		"Este joker está completamente roto. No por que este muy bien",
		"Es un infierno."
		}
	}
  },
  
  unlocked = true, 
  blueprint_compat = true, --can it be blueprinted/brainstormed/other
  eternal_compat = true, --can it be eternal
  perishable_compat = true, --can it be perishable
  rarity = 'idk_locuron',
  config = { extra = { Xmult = 2.22 } },
  loc_vars = function(self, info_queue, card)
  return { vars = { card.ability.extra.Xmult } }
  end,
  atlas = 'jokers',
  pos = { x = 2, y = 2 },
  cost = 5,
 
	calculate = function(self, card, context)
			return {
				Xmult = card.ability.extra.Xmult
			}
	end
}
SMODS.Joker {
    key = 'triple_riesgo',
    loc_txt = {
	['en-us'] = {
		name = 'Stunt Triple',
		text = {
		"{C:chips}+500{} chips",
		"{C:red}#2#{} hand size" 
		}
	},
	['es_ES'] = {
		name = 'Triple de riesgo',
		text = {
		"{C:chips}+500{} fichas",
		"{C:red}#2#{} tamaño de mano" 
		}
	}
    },
    bp_compat = true,
    config = { extra = { chips = 500, hand_size = -3 } },
    loc_vars = function(self, info_queue, card)
      return { vars = { card.ability.extra.mult, card.ability.extra.hand_size } }
    end,
    rarity = 3,
	pool = { ["cacapack"] = true },
    atlas = 'jokers',
    pos = { x = 7, y = 0 },
    cost = 7,
    blueprint_compat = true,
	add_to_deck = function(self, card, from_debuff)
		G.hand:change_size(card.ability.extra.hand_size)
	end,
	remove_from_deck = function(self, card, from_debuff)
	    G.hand:change_size(-card.ability.extra.hand_size)
	end,
    calculate = function(self, card, context)
      if context.joker_main then
       return {
			chip_mod = card.ability.extra.chips,
			message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } }
        }
    end
  end
}
SMODS.Joker {
    key = 'batman',
    loc_txt = {
	['en-us'] = {
		name = 'Batman',
		text = {
		"{C:mult}X2{} Mult.",
		"{C:money}+#1#${} at the end of round",
		"if before applying mult, score sets on fire: {C:mult}X#2#{}" 
		}
	},
	['es_ES'] = {
		name = 'Batman',
		text = {
		"{C:mult}X2{} Multi.",
		"{C:money}+#1#${} al final de cada ronda",
		"si antes de aplicar el multi, la puntuación se prende en fuego: {C:mult}X#2#{}" 
		}
	}
    },
    bp_compat = true,
    config = { extra = { money = 3, Xmult = 0.01 } },
    loc_vars = function(self, info_queue, card)
      return { vars = { card.ability.extra.money, card.ability.extra.Xmult } }
    end,
    rarity = 3,
    atlas = 'jokers',
    pos = { x = 4, y = 1 },
    cost = 8,
    blueprint_compat = true,
    calculate = function(self, card, context)
		if context.joker_main then
			if G.GAME.chips + (hand_chips * mult) >= G.GAME.blind.chips then
				return {
					Xmult = card.ability.extra.Xmult,
					message = localize { type = 'variable', key = 'a_Xmult', vars = { card.ability.extra.Xmult } },
					message = 'X' .. card.ability.extra.Xmult,
					colour = G.C.MULT	
				}
			else
				return {
					Xmult = 2
				}	
			end
		end
    end,
	calc_dollar_bonus = function(self, card)
		local bonus = card.ability.extra.money
		if bonus > 0 then return bonus end
	end
}
SMODS.Joker {
    key = 'miner',
    loc_txt = {
	['en-us'] = {
		name = 'Miner',
		text = {
		"If your scored hand contains:",
		"{C:attention}Stone Card{}, destroys it and gains {C:chips}+#2#{} chips",
		"{C:attention}Steel Card{}, destroys it and gains {X:mult,C:white}X#4#{} mult",
		"{C:attention}Glass Card{}, destroys it and gains {C:mult}+#6#{} mult",
		"Currently: {C:chips}+#1#{} chips, {X:mult,C:white}X#3#{} mult, {C:mult}+#5#{} mult"
		}
	},
	['es_ES'] = {
		name = 'Minero',
		text = {
		"Si tu mano puntuada contiene:",
		"{C:attention}Carta de Piedra{}, la destruye y gana {C:chips}+#2#{} fichas",
		"{C:attention}Carta de Acero{}, la destruye y gana {X:mult,C:white}X#4#{} multi",
		"{C:attention}Carta de Vidrio{}, la destruye y gana {C:mult}+#6#{} multi",
		"Actual: {C:chips}+#1#{} fichas, {X:mult,C:white}X#3#{} multi, {C:mult}+#5#{} multi"
		}
	}
    },
    bp_compat = true,
	loc_vars = function(self, info_queue, card)
      return { vars = { card.ability.extra.chips, card.ability.extra.chip_gain, card.ability.extra.Xmult, card.ability.extra.Xmult_gain, card.ability.extra.mult, card.ability.extra.mult_gain } }
    end,
    rarity = 3,
    atlas = 'jokers',
    pos = { x = 0, y = 2 },
    cost = 8,
	config = { extra = { chips = 0, chip_gain = 50, Xmult = 1, Xmult_gain = 0.5, mult = 0, mult_gain = 10 } },
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.destroy_card and context.cardarea == G.play and not context.repetition then
			for _, v in ipairs(context.scoring_hand) do
				if SMODS.has_enhancement(v, "m_stone") then
					card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_gain
					return {
						remove = true
					}
				end
            end
			for _, v in ipairs(context.scoring_hand) do
				if SMODS.has_enhancement(v, "m_steel") then
					card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_gain
					return {
						remove = true
					}
				end
            end
			for _, v in ipairs(context.scoring_hand) do
				if SMODS.has_enhancement(v, "m_glass") then
					card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
					return {
						remove = true
					}
				end
            end
        end
		if context.joker_main then
		    return {
				chips = card.ability.extra.chips,
				Xmult = card.ability.extra.Xmult,
				mult = card.ability.extra.mult
			}
		end
	end
}
SMODS.Joker {
  key = 'ichoosepeace',
  loc_txt = {
	['en-us'] = {
		name = 'i choose peace',
		text = {
		"If your hand contains {C:attention}Hand of the Tin-Oak{}:",
		"grants {X:mult,C:white}X#1#{} mult."
		}
	},
  	['es_ES'] = {
		name = 'elijo la paz',
		text = {
		"Si tu mano contiene {C:attention}Mano de Estaño-Roble{}:",
		"otorga {X:mult,C:white}X#1#{} multi."
		}
	}
  },
  config = { extra = { Xmult = 5 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.Xmult } }
  end,
  rarity = 3,
  atlas = 'jokers',
  blueprint_compat = true,
  pos = { x = 5, y = 2 },
  cost = 6,
  calculate = function(self, card, context)
    if context.joker_main and context.scoring_name == 'idk_ManoT' and not context.blueprint then
      return {
        Xmult_mod = card.ability.extra.Xmult,
        message = localize { type = 'variable', key = 'a_Xmult', vars = { card.ability.extra.Xmult } },
		message = 'X' .. card.ability.extra.Xmult,
        colour = G.C.MULT		
      }
    end
  end
}
SMODS.Joker {
    key = 'glaaass',
    loc_txt = {
	['en-us'] = {
		name = 'Fragile',
		text = {
		"{C:attention}Glass Cards{}, grant an additional {X:mult,C:white}X#1#{} mult",
		"{C:mult}Discarding{} a {C:attention}Glass Card{} {C:attention}destroys{} it"
		}
	},
	['es_ES'] = {
		name = 'Frágil',
		text = {
		"Las {C:attention}Cartas de Vidrio{}, otorgan {X:mult,C:white}X#1#{} multi adicional",
		"{C:mult}Descartar{} una {C:attention}Carta de Vidrio{} la {C:attention}destruye{}"
		}
	}
    },
    bp_compat = true,
	loc_vars = function(self, info_queue, card)
      return { vars = { card.ability.extra.Xmult } }
    end,
    rarity = 3,
    atlas = 'jokers',
    pos = { x = 3, y = 3 },
    cost = 8,
	config = { extra = { Xmult = 3 } },
    blueprint_compat = true,
    calculate = function(self, card, context)
	--thanks somethingcom from the balatro discord for this code <3
		if context.discard then
			if SMODS.has_enhancement(context.other_card, "m_glass") then
				return {
					remove = true
				}
			end
		end
		if context.individual and context.cardarea == G.play then
			for _, v in ipairs(context.scoring_hand) do
				if SMODS.has_enhancement(v, "m_glass") then
					return {
						Xmult = card.ability.extra.Xmult
					}
				end
            end
		end
	end
}
SMODS.Joker {
  key = 'trebol7',
  loc_txt = {
	['en-us'] = {
		name = '7 Leaf Clover',
		text = {
		"Each scored {C:green}Lucky{} {C:attention}7{} is retriggered {C:attention}#1#{} times"
		}
	},
  	['es_ES'] = {
		name = 'Trébol de 7 hojas',
		text = {
		"Cada {C:green}Carta de la Suerte{} que sea un {C:attention}7{} puntuado se reactiva {C:attention}#1#{} veces"
		}
	}
  },
  
  unlocked = true, 
  blueprint_compat = true, --can it be blueprinted/brainstormed/other
  eternal_compat = true, --can it be eternal
  perishable_compat = true, --can it be perishable
  config = { extra = { repetitions = 7 } },
  rarity = 3,
  atlas = 'jokers',
  pos = { x = 4, y = 3 },
  cost = 7,
  loc_vars = function(self, info_queue, card)
  return { vars = { card.ability.extra.repetitions } }
  end,
  calculate = function(self, card, context)
    if context.cardarea == G.play and context.repetition then
      -- :get_id tests for the rank of the card. Other than 2-10, Jack is 11, Queen is 12, King is 13, and Ace is 14.
      if context.other_card:get_id() == 7 then
			for _, v in ipairs(context.scoring_hand) do
				if SMODS.has_enhancement(v, "m_lucky") then
					return {
						message = localize('k_again_ex'),
						repetitions = card.ability.extra.repetitions,
						card = card
					}
				end
            end
      end
    end
  end
}
SMODS.Joker {
    key = 'jonkler',
    loc_txt = {
	['en-us'] = {
		name = 'Jonkler',
		text = {
		"The culio." 
		}
	},
		['es_ES'] = {
			name = 'Jonkler',
			text = {
			"El culio."
			}
		}
    },
    bp_compat = true,
    config = { extra = { } },
    rarity = 4,
    atlas = 'jokers',
    pos = { x = 3, y = 0 },
    cost = 25,
    blueprint_compat = true,
    calculate = function(self, card, context)
		if context.end_of_round and context.cardarea == G.jokers and not context.blueprint then
			local pool = {}
			for i,v in pairs(G.jokers.cards) do                                                          
				if not v:get_edition() and v ~= self then
				pool[#pool + 1] = v
				end
			end
			local randomJokerChosen = pool[math.random(1,#pool)]
			if randomJokerChosen then
				randomJokerChosen:set_edition('e_negative',true)
			end
        end
    end
}
SMODS.Joker {
    key = 'srtinoak',
    loc_txt = {
	['en-us'] = {
		name = 'Mr. Tin-Oak',
		text = {
			"Gains {X:dark_edition,C:white}^#2#{} if your played hand is {C:attention}Hand of the Tin-Oak{}",
			"{C:inactive}{}Currently: {X:dark_edition,C:white}^#1#{} {C:inactive}{}mult"
		}
	},
		['es_ES'] = {
			name = 'Mr. Estaño-Roble',
			text = {
			"Gana {X:dark_edition,C:white}^#2#{} multi cuando juegas una {C:attention}Mano de Estaño-Roble{}",
			"{C:inactive}{}Actual: {X:dark_edition,C:white}^#1#{} {C:inactive}{}multi"
			}
		}
    },
    bp_compat = true,
    config = { extra = { Emult = 1, Emult_gain = 0.05 } },
    loc_vars = function(self, info_queue, card)
      return { vars = { card.ability.extra.Emult, card.ability.extra.Emult_gain } }
    end,
    rarity = 4,
    atlas = 'jokers',
    pos = { x = 4, y = 2 },
    cost = 25,
    blueprint_compat = true,
    calculate = function(self, card, context)
		if context.before and context.scoring_name == 'idk_ManoT' and not context.blueprint then
			card.ability.extra.Emult = card.ability.extra.Emult + card.ability.extra.Emult_gain
			return {
				message = '+^' .. '0.05',
				card = card			
			}
		end
		if context.joker_main then
		    return {
				Emult_mod = card.ability.extra.Emult,
				message = localize { type = 'variable', key = 'a_powmult', vars = { card.ability.extra.Emult } },
				message = '^' .. card.ability.extra.Emult,
				colour = G.C.MULT	
			}
		end
	end
}
SMODS.Enhancement {
	key = 'chipped',
    loc_txt = {
	['en-us'] = {
		name = 'Chipped Card',
		text = {
		"{C:chips}X2{} Chips when held in hand" 
		}
	},
	['es_ES'] = {
		name = 'Carta Chipiada',
		text = {
		"{C:chips}X2{} fichas mientras tienes",
		"esta carta en tu mano"
		}
	}
  },
    atlas = 'enhancements',
    pos = { x = 0, y = 0 },
	config = { h_x_chips = 2 }
}
SMODS.Joker {
  key = 'falll',
  loc_txt = {
	['en-us'] = {
		name = 'Cardiac Arrest 3: THE REVENGE',
		text = {
		"this joker    ^mult from   -10   to",
		"",
		"10"
		}
	},
	['es_ES'] = {
		name = 'Fallo Cardiaco 3: AHORA ES PERSONAL',
		text = {
		"est  e yo que r  eleba tu multi en un ran",
		"go     de -10 a 10"
		}
	}
  },
  config = { extra = { 
    Emult_min = -10,
    Emult_max = 10,
	odds = 2
  } },
  rarity = 'idk_elquefiltra',
  atlas = 'jokers',
  pos = { x = 3, y = 2 },
  cost = 69,
  blueprint_compat = true,
  loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.Emult } }
  end,
	calculate = function(self, card, context)
		if context.joker_main then
			local Emult_min = card.ability.extra.Emult_min
			local Emult_max = card.ability.extra.Emult_max
			card.ability.extra.Emult = math.random(Emult_min, Emult_max)
		    return {
				Emult_mod = card.ability.extra.Emult,
				message = localize { type = 'variable', key = 'a_powmult', vars = { card.ability.extra.Emult } },
				message = '^' .. card.ability.extra.Emult,
				colour = G.C.MULT	
			}
		end
		if context.selling_self and not context.blueprint then
		    if pseudorandom('fallL') < G.GAME.probabilities.normal / card.ability.extra.odds then
				G.E_MANAGER:add_event(Event({
					func = function()
						SMODS.restart_game()
					end
				}))			
			end
		end
	end
}
SMODS.Joker {
    key = 'elcocheencuestion',
    loc_txt = {
	['en-us'] = {
		name = 'The car I was talking about:',
		text = {
		"Thank you momma! Gains {C:mult}+#2#{} mult and creates a {C:negative}negative{} {C:attention}Legendary Joker{}",
		"if you have {C:attention}They took the car away{}",
		"Currently: {C:mult}+#1#{} mult"
		}
	},
		['es_ES'] = {
			name = 'El coche en cuestión:',
			text = {
			"Gracias mama! Gana {C:mult}+#2#{} multi y genera un {C:attention}Joker Legendario{} {C:negative}negativo{}",
			"si tienes {C:attention}Se han llevao el coche{}",
			"Actual: {C:mult}+#1#{} multi"
			}
		}
    },
    bp_compat = true,
    config = { extra = { mult = 111.1, mult_gain = 9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999 } },
    rarity = 'idk_elquefiltra',
    atlas = 'jokers',
    pos = { x = 1, y = 3 },
    cost = 69,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult, card.ability.extra.mult_gain } }
	end,
    blueprint_compat = true,
    calculate = function(self, card, context)
		if context.joker_main and context.cardarea == G.jokers and not context.blueprint then
			local pool = {}
			for i,v in pairs(G.jokers.cards) do                                                          
				if #SMODS.find_card('j_idk_sehanllevaoelcoche') > 0 then
					card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
					G.E_MANAGER:add_event(Event({
						func = function()
								SMODS.add_card({set = 'Joker', area = G.jokers, legendary = true, edition = 'e_negative'})
							return true
						end
					}))			
				end
			end
			return {
				mult = card.ability.extra.mult
			}
        end
    end
}
SMODS.Consumable{
    key = 'el_chipiador', --key
    set = 'Spectral', --the set of the card: corresponds to a consumable type
    atlas = 'consumables', --atlas
    pos = {x = 1, y = 0}, --position in atlas
    loc_txt = {
	['en-us'] = {
		name = 'The Chipper',
		text = {
		"Select #1# cards, convert them to {C:chips}Chipped Card{}" 
		}
	},
	['es_ES'] = {
		name = 'Carta Chipiada',
		text = {
		"Selecciona #1# cartas, las convierte en {C:chips}Cartas Chipiadas{}" 
		}
	}
  },
    config = {
        extra = {
            cards = 2, --configurable value
        }
    },
    loc_vars = function(self,info_queue, center)
        return {vars = {center.ability.extra.cards}} --displays configurable value: the #1# in the description is replaced with the configurable value
    end,
    can_use = function(self,card)
        if G and G.hand then
            if #G.hand.highlighted ~= 0 and #G.hand.highlighted <= card.ability.extra.cards then --if cards in hand highlighted are above 0 but below the configurable value then
                return true
            end
        end
        return false
    end,
    use = function(self,card,area,copier)
        for i = 1, #G.hand.highlighted do 
            --for every card in hand highlighted

            G.hand.highlighted[i]:set_ability(G.P_CENTERS.m_idk_chipped, nil, true)
            --set their edition to negative
        end
    end,
}
SMODS.Consumable{
    key = 'elpepe', --key
    set = 'Spectral', --the set of the card: corresponds to a consumable type
    atlas = 'consumables', --atlas
    pos = {x = 0, y = 0}, --position in atlas
    loc_txt = {
	['en-us'] = {
		name = 'the pe   ep',
		text = {
		"Creates a {C:purple}ACTIVATE WINDOWS{} {C:attention}Joker{}",
		"{C:inactive}(Must have room){}" 
		}
	},
	['es_ES'] = {
		name = 'el pe    pe',
		text = {
		"Crea un {C:attention}Joker{} {C:purple}ACTIVAR WINDOWS{}",
		"{C:inactive}(Debes tener espacio){}"		
		}
	}
    },
    config = {
		unlocked = true,
		discovered = true
    },
	soul_set = 'Spectral',
	soul_rate = 0.002,
	can_repeat_soul = true,
    can_use = function(self,card)
            if #G.jokers.cards < G.jokers.config.card_limit or self.area == G.jokers then
                return true
            else
                return false
            end
    end,
    use = function(self,card,area,copier)
		SMODS.add_card({set = 'Joker', area = G.jokers, rarity = 'idk_elquefiltra' })
    end,
}
SMODS.Rarity {
	key = 'mierdonhistorico',
	loc_txt = {
		['en-us'] = {
			name = 'Njc0ODY5MjA2'
		},
		['es_ES'] = {
			name = 'mierdon historico',
		}
	},
	pools = {
	["Joker"] = true, --uses self.default_rate when polled
    ["Joker"] = { rate = -666 },
	},
	default_weight = 0,
	badge_colour = HEX('6B4928')
}
SMODS.Rarity {
	key = 'locuron',
	loc_txt = {
		['en-us'] = {
			name = 'you suck'
		},
		['es_ES'] = {
			name = 'te jodes',
		}
	},
	pools = {
	["Joker"] = true, --uses self.default_rate when polled
    ["Joker"] = { rate = 0.03 },
	},
	badge_colour = HEX('FF4C6D'),
	default_weight = 0.03
}
SMODS.Rarity {
	key = 'elquefiltra',
	loc_txt = {
		['en-us'] = {
			name = 'ACTIVATE WINDOWS'
		},
		['es_ES'] = {
			name = 'ACTIVAR WINDOWS',
		}
	},
	pools = {
	["Joker"] = true, --uses self.default_rate when polled
    ["Joker"] = { rate = 0.001 },
	},
	badge_colour = HEX('C700FF'),
	default_weight = 0
}
