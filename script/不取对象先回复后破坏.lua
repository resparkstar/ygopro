--【外服】贪欲或无欲之壶
function c5491.initial_effect(c)
	--Activate
	local e1=Effect.CreateEffect(c)
	e1:SetCategory(CATEGORY_DESTROY+CATEGORY_RECOVER)
	e1:SetType(EFFECT_TYPE_ACTIVATE)
	e1:SetProperty(EFFECT_FLAG_CARD_TARGET)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetTarget(c5491.target)
	e1:SetOperation(c5491.activate)
	c:RegisterEffect(e1)
end
function c5491.filter(c)
	return c:IsFaceup() and c:IsDestructable()
end
function c5491.target(e,tp,eg,ep,ev,re,r,rp,chk,chkc)
	if chkc then return chkc:IsControler(1-tp) and chkc:IsLocation(LOCATION_MZONE) and c5491.filter(chkc) end
	if chk==0 then return true end 
	Duel.SetOperationInfo(0,CATEGORY_RECOVER,nil,0,1-tp,1000)
	Duel.SetOperationInfo(0,CATEGORY_DESTROY,g,1,0,0)
end
function c5491.activate(e,tp,eg,ep,ev,re,r,rp)
	 if Duel.Recover(1-tp,1000,REASON_EFFECT)~=0 then
		Duel.BreakEffect()
		local g=Duel.GetFieldGroup(tp,0,LOCATION_ONFIELD)
		Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_DESTROY)  
		local tc=g:Select(tp,1,1,nil) 
		Duel.HintSelection(tc) 
		Duel.Destroy(tc,REASON_EFFECT)
	 end
end
   
   
		
