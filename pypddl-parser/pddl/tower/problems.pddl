(define (problem tower-1)
(:domain tower)
(:objects
	block1
    block2
    block3
)
(:init ( and
	(on-floor block1)
    (on-floor block2)
    (on-floor block3) )
)
(:goal (> 3 
    (+ (weight block1) (weight block2) (weight block3))
))

)
