(deffacts robot_recogedor
    (robot carga_maxima 3 carga_actual 0)
    (stock naranjas 5 manzanas 5 caquis 5 uva 5)
    (pedido_entregado naranjas_entr 0 manzanas_entr 0 caquis_entr 0 uva_entr 0 )
    (pedido naranjas_soli 2 manzanas_soli 3 caquis_soli 0 uva_soli 1)
)

(defrule recoger
    (declare (salience 1))
    (robot X ?x Y ?y)
    (tamanyo_maximo  X ?maximo_x Y ?maximo_Y $?info)
    (test  (< ?x ?maximo_x))
    (not (obstaculos X = (+ ?x 1) Y ?y))
    =>
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
    (pedido_entregado naranjas_entr ?n manzanas_entr ?m caquis_entr 0 uva_entr 0 )
    (pedido naranjas_soli ?n_s manzanas_soli ?m_s caquis_soli ?c_s uva_soli ?u_s)
    
    (test (= ?estado 1))
    (test (and (= ?x ?casa_x) (= ?y ?casa_y)))
    =>
    (printout t "Se ha entregado el paquete! " crlf)
    (halt)
    )
    