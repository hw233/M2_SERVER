local constant = {}

--庄家模式
constant.BankerMode = {
	YING = 1,    -- 赢家做庄
	LIAN = 2, 	 -- 连庄 按顺序坐庄
	RAND = 3,    -- 随机庄家
}

constant.OVER_TYPE = {
	NORMAL = 1, --正常胡牌
	FLOW = 2,	--流局	
}

constant.TYPE = {
	CHI = 1,
	PENG = 2,
	PENG_GANG = 3,
	MING_GANG = 4,
	AN_GANG = 5,
	HU = 6
}


constant.FANTYPE = {
	QIA_ZHANG = "QIA_ZHANG",
	BIAN_ZHANG = "BIAN_ZHANG",
	QUE_MEN = "QUE_MEN",
	MEN_QING = "MEN_QING",
	AN_KA = "AN_KA",
}

return constant