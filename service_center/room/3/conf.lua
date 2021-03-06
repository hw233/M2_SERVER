local MJ_CARDS_TYPE = {
	[1] = "🀇",
	[2] = "🀈",
	[3] = "🀉",
	[4] = "🀊",
	[5] = "🀋",
	[6] = "🀌",
	[7] = "🀍",
	[8] = "🀎",
	[9] = "🀏",

	[11] = "🀐",
	[12] = "🀑",
	[13] = "🀒",
	[14] = "🀓",
	[15] = "🀔",
	[16] = "🀕",
	[17] = "🀖",
	[18] = "🀗",
	[19] = "🀘",

	[21] = "🀙",
	[22] = "🀚",
	[23] = "🀛",
	[24] = "🀜",
	[25] = "🀝",
	[26] = "🀞",
	[27] = "🀟",
	[28] = "🀠",
	[29] = "🀡",

	[31] = "🀁",
	[32] = "🀂",
	[33] = "🀃",
	[34] = "🀅",
	[35] = "🀄",
	[36] = "🀆"
}

local card_list = {
		1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,21,22,23,24,25,26,27,28,29,35,
		1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,21,22,23,24,25,26,27,28,29,35,
		1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,21,22,23,24,25,26,27,28,29,35,
		1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,21,22,23,24,25,26,27,28,29,35
	}


local handle1 = {11,11,11,11,21,21,1,14,14,  

4,4,4,4,3,3,3,3,2,2,2,1,1,

29,14,15,16,13,13,13,13,12,12,12,2,1,     
}

for _,v in ipairs(handle1) do
	for i=#card_list,1,-1 do
		local card = card_list[i]
		if v == card then
			table.remove(card_list,i)
			break
		end
	end
end

for _,v in ipairs(handle1) do
	table.insert(card_list,v)
end

return {card_list=card_list,zpos = 1}
--return card_list