--【外服】决斗者降临
function c5539.initial_effect(c)
	 --Activate
	local e1=Effect.CreateEffect(c)
	e1:SetCategory(CATEGORY_TODECK)
	e1:SetType(EFFECT_TYPE_ACTIVATE)
	e1:SetProperty(EFFECT_FLAG_PLAYER_TARGET)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetTarget(c5539.target)
	e1:SetOperation(c5539.activate)
	c:RegisterEffect(e1)
end
function c5539.target(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.IsExistingMatchingCard(Card.IsAbleToDeck,tp,LOCATION_GRAVE,0,1,e:GetHandler()) end
	Duel.SetTargetPlayer(tp)
	Duel.SetOperationInfo(0,CATEGORY_TODECK,nil,1,tp,LOCATION_GRAVE)
	Duel.SetOperationInfo(0,CATEGORY_DRAW,nil,0,tp,1)  
end
function c5539.activate(e,tp,eg,ep,ev,re,r,rp)
	local p=Duel.GetChainInfo(0,CHAININFO_TARGET_PLAYER)
	local g=Duel.GetMatchingGroup(Card.IsAbleToDeck,p,LOCATION_GRAVE,0,nil)
	Duel.Hint(HINT_SELECTMSG,p,HINTMSG_TODECK)
	local sg=g:Select(p,1,1,nil)
	 if Duel.SendtoDeck(sg,nil,2,REASON_EFFECT)>0 then
	 Duel.BreakEffect()  
	 Duel.ShuffleDeck(tp) 
	 Duel.Draw(tp,1,REASON_EFFECT)
	 end
end

   