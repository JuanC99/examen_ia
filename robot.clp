(deffacts robot_recogedor
    (robot carga_maxima 3 carga_actual 0)
    (stock naranjas 5 manzanas 5 caquis 5 uva 5)
    (pedido_entregado naranjas_entr 0 manzanas_entr 0 caquis_entr 0 uva_entr 0 )
    (pedido naranjas_soli 2 manzanas_soli 3 caquis_soli 0 uva_soli 1)
)

(defrule recoger_naranjas
    (robot carga_maxima ?max carga_actual ?act)
    (stock naranjas ?stock_n manzanas ?stock_m caquis ?stock_c uva ?stock_u)
    (pedido_entregado naranjas_entr ?n_entr manzanas_entr ?m_entr caquis_entr ?c_entr uva_entr ?u_entr)
    (pedido naranjas_soli ?n_soli manzanas_soli ?m_soli caquis_soli ?c_soli uva_soli ?u_soli)
    
    (test (< ?act ?max))
    (test (< ?n_soli ?n_entr))
    =>
    (assert (robot carga_maxima )
    (assert (robot X (+ ?x 1) Y ?y))
    )

(defrule entregar
    (declare (salience 1))
    (robot X ?x Y ?y)
    (tamanyo_maximo  X ?maximo_x Y ?maximo_Y $?info)
    (test  (> ?x 0))
    (not (obstaculos X = (- ?x 1) Y ?y))
    =>
    (assert (robot X (- ?x 1) Y ?y))
    )

(defrule final
    (declare (salience 20))
    (pedido_entregado naranjas_entr ?n manzanas_entr ?m caquis_entr ?c uva_entr ?u)
    (pedido naranjas_soli ?n_s manzanas_soli ?m_s caquis_soli ?c_s uva_soli ?u_s)

    (test (and (= ?n ?n_s) (= ?m ?m_s)))
    (test (and (= ?c ?c_s) (= ?u ?u_s)))
    =>
    (printout t "Se ha finalizado la entrega!" crlf)
    (halt)
    )
    