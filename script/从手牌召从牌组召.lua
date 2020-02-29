--オーロラ・ドロー
function c100000038.initial_effect(c)
	 --spsummon  
	local e1=Effect.CreateEffect(c)  
	e1:SetCategory(CATEGORY_SPECIAL_SUMMON)  
	e1:SetType(EFFECT_TYPE_ACTIVATE)  
	e1:SetCode(EVENT_FREE_CHAIN)  
	e1:SetTarget(c100000038.sptg)  
	e1:SetOperation(c100000038.spop)  
	c:RegisterEffect(e1)  
end  
function c100000038.spfilter(c,e,tp)  
	return c:IsCanBeSpecialSummoned(e,0,tp,false,false)  
end  
function c100000038.sptg(e,tp,eg,ep,ev,re,r,rp,chk)  
	if chk==0 then return  Duel.IsExistingMatchingCard(c100000038.spfilter,tp,LOCATION_DECK,0,1,nil,e,tp) and
		Duel.GetLocationCount(tp,LOCATION_MZONE)>1
		and Duel.IsExistingMatchingCard(c100000038.spfilter,tp,LOCATION_HAND,0,1,nil,e,tp)  end  
	Duel.SetOperationInfo(0,CATEGORY_SPECIAL_SUMMON,nil,1,tp,LOCATION_DECK) 
	Duel.SetOperationInfo(0,CATEGORY_SPECIAL_SUMMON,nil,1,tp,LOCATION_HAND)  
end  
function c100000038.spop(e,tp,eg,ep,ev,re,r,rp)  
	local c=e:GetHandler()  
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_SPSUMMON)   
	local g2=Duel.SelectMatchingCard(tp,c100000038.spfilter,tp,LOCATION_DECK,0,1,1,nil,e,tp) 
	if Duel.SpecialSummon(g2,0,tp,tp,false,false,POS_FACEUP)~=0 then
	Duel.BreakEffect() 
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_SPSUMMON)  
	local g=Duel.SelectMatchingCard(tp,c100000038.spfilter,tp,LOCATION_HAND,0,1,1,nil,e,tp)   
	Duel.SpecialSummon(g,0,tp,tp,false,false,POS_FACEUP)			
	end  
end  
  
	