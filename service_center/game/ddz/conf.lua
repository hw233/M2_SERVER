local conf = {}

-- 总开关，关闭之后就无法使用自己配置的牌
conf.isUserMake = true
-- 庄家
conf.iMianPlayer = 0
-- 是否开启个人配牌
conf.isOpen1 = true
conf.isOpen2 = true
conf.isOpen3 = true


-- {
-- 	103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 120, 
-- 	203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 220, 
-- 	303, 304, 305, 306, 307, 308, 309, 310, 311, 312, 313, 314, 315, 320, 
-- 	403, 404, 405, 406, 407, 408, 409, 410, 411, 412, 413, 414, 415, 420, 
-- 	124, 125
-- }

-- 牌数组
conf.card1 = {103, 103, 103, 103, 104, 104,104, 104, 105, 105, 105, 105}
conf.card2 = {}
conf.card3 = {}

-- 底牌
conf.cardMain = {}


print("---------------", conf)
dump(conf)



return  conf