--�\ħ�g�Υ���`��  
function c82404868.initial_effect(c)  
	 --Activate
	local e1=Effect.CreateEffect(c)
	e1:SetCategory(CATEGORY_SPECIAL_SUMMON)
	e1:SetType(EFFECT_TYPE_ACTIVATE)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetTarget(c82404868.target)
	e1:SetOperation(c82404868.activate)
	c:RegisterEffect(e1)
end
function c82404868.filter(c,e,tp)
	return c:IsCanBeSpecialSummoned(e,0,tp,false,false)
end
function c82404868.target(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.GetLocationCount(tp,LOCATION_MZONE)>0
		and Duel.IsExistingMatchingCard(c82404868.filter,tp,LOCATION_HAND,0,1,nil,e,tp) end
	Duel.SetOperationInfo(0,CATEGORY_SPECIAL_SUMMON,nil,1,tp,LOCATION_HAND)
end
function c82404868.activate(e,tp,eg,ep,ev,re,r,rp)
	if Duel.GetLocationCount(tp,LOCATION_MZONE)<=0 then return end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_SPSUMMON)
	local g=Duel.SelectMatchingCard(tp,c82404868.filter,tp,LOCATION_HAND,0,1,1,nil,e,tp)
	 if Duel.SpecialSummon(g,0,tp,tp,false,false,POS_FACEUP)~=0 then
	 Duel.BreakEffect()  
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_DESTROY)  
	local g1=Duel.GetFieldGroup(tp,LOCATION_ONFIELD,LOCATION_ONFIELD)
		local sg=g1:Select(tp,1,1,nil)  
		Duel.HintSelection(sg)  
		Duel.Destroy(sg,REASON_EFFECT) 
	end
end
	
