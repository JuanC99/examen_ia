(deffacts robot_recogedor
    (robot carga_maxima 3 carga_actual 0 ? niguna)
    (stock fruta naranjas 5 fruta manzanas 5 fruta caquis 5 fruta uva 5)
    (pedido_entregado fruta naranjas 0  fruta manzanas 0 fruta caquis 0 fruta uva 0 )
    (pedido fruta naranjas 2 fruta manzanas 3 fruta caquis 0 fruta uva 1)
)

(defrule recoger
    (robot carga_maxima ?max carga_actual ?act ?fruta)
    (stock ?$ini fruta ?fruta ?stock_f ?$?fin)
    (pedido_entregado ?$ini2 fruta ?fruta_entr ?cantidad_entr ?$?fin2)
    (pedido ?$ini3 fruta ?fruta_sol ?cantidad_sol ?$?fin3)
    
    (test (< ?act ?max))
    (test (< ?n_soli ?n_entr))
    =>
    (assert (robot )
    (assert (robot X (+ ?x 1) Y ?y))
    )

(defrule entregar
    (robot carga_maxima ?max carga_actual ?act ?fruta_sol)
    (stock ?$ini fruta ?fruta ?stock_f ?$?fin)
    (pedido_entregado ?$ini2 fruta ?fruta_entr ?cantidad_entr ?$?fin2)
    (pedido ?$ini3 fruta ?fruta_sol ?cantidad_sol ?$?fin3)
    
    (test (> ?act ?0))
    =>
    (assert (robot ?max carga_actual 0 niguna)
    (assert (pedido_entregado ?$ini2 ?fruta_sol (+ ?act ?cantidad_sol) ?$?fin2))
    )


(defrule final
    (declare (salience 20))
    (pedido_entregado fruta naranjas fruta ?n manzanas fruta ?m caquis fruta ?c uva ?u)
    (pedido fruta naranjas ?n_s fruta manzanas ?m_s fruta caquis ?c_s fruta uva ?u_s)

    (test (and (= ?n ?n_s) (= ?m ?m_s)))
    (test (and (= ?c ?c_s) (= ?u ?u_s)))
    =>
    (printout t "Se ha finalizado la entrega!" crlf)
    (halt)
    )
    