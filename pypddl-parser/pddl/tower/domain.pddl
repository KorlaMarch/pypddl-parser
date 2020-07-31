( define ( domain tower )
	( :requirements :strips :equality )
	( :predicates
		( on ?x ?y )
        ( flat-top ?x )
        ( flat-bottom ?x )
        ( stackable ?x ?y)
        ( on-floor ?x )
        ( on-top ?x )
	)

	( :action stack
		:parameters ( ?x ?y )
		:precondition ( and
            ( not ( = ?x ?y ) )
			( on-floor ?x )
			( on-top ?y )
		)
		:effect ( and
			( not (on-top ?y ) )
			( not (on-floor ?x ) )
            ( on-top ?x )
			( on ?x ?y )
		)
        :heuristic (stack-tall
            :goal (???) ;; how do we specify the goal??
            :relation (add (stackable ?x ?y) ()))
	)

    (:cause stackable
        :parameters ( ?x ?y ) ; stack x on top of y
        :relation ( and
            ( flat-bottom ?x )
            ( flat-top ?y )
        ))
    
    (:cause stackable ;; now we'll have (bottom, top, dummy) -> stackable
        :parameters ( ?x ?y )
        :relation ( dummy ?x ))
)