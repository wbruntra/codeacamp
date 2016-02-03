def granny_respond(input)
    if input != input.mb_chars.upcase.to_s
      r = 'QUÉ DIJO?! HABLE MÁS CLARO'
    else
      if input == 'BYE'
        r = 'ADIÓS, NIÑO'
      else
        r = 'EH? NO DESDE '+(1950+rand(20)).to_s
      end
    end
end