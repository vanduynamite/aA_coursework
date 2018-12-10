

def ftoc(temp_f)
  (temp_f - 32) * 5 / 9
end

def ctof(temp_c)
  (temp_c * 9).to_f / 5 + 32
end
