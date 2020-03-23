 --【SIY】地矿爆破
function c6220.initial_effect(c)
	 --recover&damage
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_ACTIVATE)
	e1:SetCategory(CATEGORY_RECOVER+CATEGORY_DAMAGE+CATEGORY_DRAW)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetTarget(c6220.target)
	e1:SetOperation(c6220.operation)
	c:RegisterEffect(e1)
end
function c6220.target(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return true end
	Duel.SetOperationInfo(0,CATEGORY_RECOVER,nil,0,tp,500)
	Duel.SetOperationInfo(0,CATEGORY_DAMAGE,nil,0,1-tp,500)
	Duel.SetOperationInfo(0,CATEGORY_DRAW,nil,0,tp,1)
	Duel.SetOperationInfo(0,CATEGORY_DRAW,nil,0,1-tp,1)
end
function c6220.operation(e,tp,eg,ep,ev,re,r,rp)
	if Duel.Damage(1-tp,500,REASON_EFFECT)~=0 then
	Duel.BreakEffect()
	Duel.Recover(tp,500,REASON_EFFECT)
	Duel.BreakEffect()
	Duel.Draw(tp,1,REASON_EFFECT)
	Duel.BreakEffect()
	Duel.Draw(1-tp,1,REASON_EFFECT)
	end
end