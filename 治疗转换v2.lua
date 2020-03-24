--【あ】反转反转
function c6499.initial_effect(c)
	  --Activate  
	local e1=Effect.CreateEffect(c)  
	e1:SetCategory(CATEGORY_DRAW+CATEGORY_RECOVER)  
	e1:SetType(EFFECT_TYPE_ACTIVATE)  
	e1:SetCode(EVENT_ATTACK_ANNOUNCE)  
	e1:SetCondition(c6499.condition)  
	e1:SetTarget(c6499.target)  
	e1:SetOperation(c6499.activate)  
	c:RegisterEffect(e1)  
end  
function c6499.condition(e,tp,eg,ep,ev,re,r,rp)  
	return Duel.GetAttacker():IsControler(1-tp) and Duel.GetAttackTarget()==nil  
end  
function c6499.target(e,tp,eg,ep,ev,re,r,rp,chk)  
	if chk==0 then return Duel.IsPlayerCanDraw(tp,1) end  
	Duel.SetOperationInfo(0,CATEGORY_DRAW,nil,0,tp,1)  
end  
function c6499.activate(e,tp,eg,ep,ev,re,r,rp)  
	if Duel.NegateAttack()~=0 then
	Duel.BreakEffect()
	Duel.SkipPhase(1-tp,PHASE_BATTLE,RESET_PHASE+PHASE_BATTLE,1)   
	Duel.BreakEffect()  
	local g=Duel.GetDecktopGroup(tp,1)  
	local tc=g:GetFirst()  
	Duel.Draw(tp,1,REASON_EFFECT)  
	Duel.ConfirmCards(1-tp,tc)  
	if  tc:IsType(TYPE_MONSTER) then 
	Duel.Recover(tp,tc:GetAttack(),REASON_EFFECT)   
	end  
	Duel.ShuffleHand(tp)  
	end 
end   
	   
	