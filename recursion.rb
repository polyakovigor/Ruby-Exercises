def search_value(obj, key)
  if obj.is_a?(Hash) && obj.key?(key)
    result = obj[key]
  elsif obj.is_a?(Array) || obj.is_a?(Hash)
    obj.each do |item|
      result = search_value(item, key)
      break if result != nil
    end
  end
  result
end

hash = {"test"=>1,proc{}=>[[{:key=>"sss"},{"pass"=>{"a"=> [1,{:bsd => [[],[],[],[],[],[[proc{}] => {[7,1]=>{:rr=>111}}]]}] }}], [1,[:olol, {[1, {:trolo => "r"}] => 1}]]],"zero"=>7,"kuk"=>[{"tr"=>"jxp"},{:lx=>"xp"}]}
p search_value(hash,:bsd)
