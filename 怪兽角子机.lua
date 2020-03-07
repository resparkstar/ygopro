
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
	if chk==0 then return Duel.IsPlayerCanDraw(tp,1) and Duel.IsExistingTarget(c6220.filter1,tp,LOCATION_MZONE,0,1,nil,tp) end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_FACEUP)  
	local g1=Duel.SelectTarget(tp,c6220.filter1,tp,LOCATION_MZONE,0,1,1,nil,tp) 
	Duel.SetOperationInfo(0,CATEGORY_DRAW,nil,0,tp,1)  
end  
function c6220.operation(e,tp,eg,ep,ev,re,r,rp)
	 local tc1=e:GetLabelObject()  
	local g=Duel.GetChainInfo(0,CHAININFO_TARGET_CARDS)  
	local tc1=g:GetFirst()   
	if tc1:IsFacedown() or not tc1:IsRelateToEffect(e) then return end   
	Duel.BreakEffect()  
	if Duel.Draw(tp,1,REASON_EFFECT)==0 then return end  
	local dr=Duel.GetOperatedGroup():GetFirst()  
	Duel.ConfirmCards(1-tp,dr)  
	Duel.BreakEffect()  
	if dr:GetLevel()==tc1:GetLevel() then  
		if Duel.SpecialSummon(dr,0,tp,tp,false,false,POS_FACEUP)==0 then
	   Duel.ShuffleHand(tp)  
		end  
	else Duel.ShuffleHand(tp) end  
end   
		 