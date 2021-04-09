function Trig_Setting_Character_B_Actions takes nothing returns nothing
	set i = i + 1
	set udg_HeroType[ (i)] = 'E02E'
	set udg_HeroIcon[ (i)] = "ReplaceableTextures\\CommandButtons\\BTN_reisenNo2.blp"
	set udg_HeroButton[ (i)] = 'B02W'
	set udg_HeroBrief[ (i)] = "|cff00ccff~月面防御部队~|r\n|cffffcc00Reisen|r\n|cffcccccc■|r突袭型　　 近战攻距 150 移动速度 310\n|cffffcc00○ |r|cffff0033力量|r - 20 + 2.25     基础伤害 62~66\n|cffffcc00● |r|cff00ff99敏捷|r - 25 + 2.25     基础护甲 2.00\n|cffffcc00○ |r|cff0033ff智力|r - 15 + 1.50     |cff00ff00「初心向角色」|r "
	call AI_HeroSkill(i,'A0ZD','A0ZF','A0ZJ','A0ZK','A03Y')
	call DB_SetHeroTypeData(udg_HeroType[i], DB_HERO_PRIMARY_TYPE(), DB_ENUM_AGI())
	call DB_SetHeroTypeData(udg_HeroType[i], DB_HERO_MULTIPLE_ATTACK(),'A0K1')
	set udg_HeroInit[ (i)] = gg_trg_Initialing_ReisenNo2
endfunction