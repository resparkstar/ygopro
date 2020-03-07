   --【SIY】地矿爆破
function c6220.initial_effect(c)
	  --todeck  
	local e1=Effect.CreateEffect(c)  
	e1:SetCategory(CATEGORY_DRAW+CATEGORY_SPECIAL_SUMMON)
	e1:SetType(EFFECT_TYPE_ACTIVATE)  
	e1:SetCode(EVENT_FREE_CHAIN)  
	e1:SetTarget(c6220.target)  
	e1:SetOperation(c6220.operation)  
	c:RegisterEffect(e1)  
end 
   
function c6220.target(e,tp,eg,ep,ev,re,r,rp,chk)  
	if chk==0 then return Duel.IsPlayerCanDraw(tp,1) end	
	Duel.SetOperationInfo(0,CATEGORY_DRAW,nil,0,tp,1)  
end  
function c6220.operation(e,tp,eg,ep,ev,re,r,rp)  
		if Duel.Draw(tp,1,REASON_EFFECT)>0 then
		Duel.BreakEffect()  
		local dg=Duel.GetOperatedGroup()  
		local dc=dg:GetFirst()  
		if Duel.GetLocationCount(tp,LOCATION_MZONE)>0 and dc:IsCanBeSpecialSummoned(e,0,tp,false,false)  
			and Duel.SelectYesNo(tp,aux.Stringid(6220,0)) then  
			Duel.SpecialSummon(dc,0,tp,tp,false,false,POS_FACEUP)  
		end  
	end  
end  
	   