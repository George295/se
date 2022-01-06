;
;-------Auxiliary facts ---------------------------------------
;

(defrule AGENT::initCycle-overtaking
    (declare (salience 89))
    (timp (valoare ?)) ;make sure it fires each cycle
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>initCycle-overtaking prohibited by default " crlf))
    (assert (ag_bel (bel_type moment) (bel_pname overtaking-maneuver) (bel_pval prohibited))) ;by default, we assume overtaking NOT valid
    ;(facts AGENT)
)

(defrule AGENT::initCycle-right-turn
    (declare (salience 89))
    (timp (valoare ?)) ;make sure it fires each cycle
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>initCycle-right-turn prohibited by default " crlf))
    (assert (ag_bel (bel_type moment) (bel_pname right-turn-maneuver) (bel_pval prohibited))) ;by default, we assume overtaking NOT valid
    ;(facts AGENT)
)

(defrule AGENT::initCycle-left-turn
    (declare (salience 89))
    (timp (valoare ?)) ;make sure it fires each cycle
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>initCycle-left-turn prohibited by default " crlf))
    (assert (ag_bel (bel_type moment) (bel_pname left-turn-maneuver) (bel_pval prohibited))) ;by default, we assume overtaking NOT valid
    ;(facts AGENT)
)

(defrule AGENT::cale_ferat
    (timp (valoare ?t))
    (ag_bel (bel_type moment) (bel_pobj ev1))
    (ag_bel (bel_type moment) (bel_pobj railroad1) (bel_pname distance_to_my_car) (bel_pval ?v))
    (test (< ?v 50))
=>
    (assert (ag_bel (bel_type fluent) (bel_pname cale_ferat) (bel_pval yes)))
)

(defrule AGENT::final_cale_ferata
    (timp (valoare ?t))
    (ag_bel (bel_type moment) (bel_pobj ev1))
    ?f <- (ag_bel (bel_type fluent) (bel_pname cale_ferat) (bel_pval yes))
    (ag_bel (bel_type moment) (bel_pobj road_sign2) (bel_pname type) (bel_pval railroad))
=>
    (retract ?f)
)

(defrule AGENT::coloana_oficiala
    (timp (valoare ?t))
    (ag_bel (bel_type moment) (bel_pobj ev14))
    (ag_bel (bel_type moment) (bel_pobj car2) (bel_pname partof) (bel_pval lane1))
    (ag_bel (bel_type moment) (bel_pobj car1) (bel_pname partof) (bel_pval lane1))
    (ag_bel (bel_type moment) (bel_pobj car2) (bel_pname type) (bel_pval politie))
    (ag_bel (bel_type moment) (bel_pobj car2) (bel_pname semn_depasire) (bel_pval nu))
    (ag_bel (bel_type moment) (bel_pobj car2) (bel_pname partof) (bel_pval coloana1))
=>
    (assert (ag_bel (bel_type fluent) (bel_pname coloana_oficiala) (bel_pval yes)))
    (printout t "Depasire interzisa, coloana oficiala!"  crlf)
)

(defrule AGENT::coloana_oficiala_semn_pol
    (timp (valoare ?t))
    (ag_bel (bel_type moment) (bel_pobj ev14))
    (ag_bel (bel_type moment) (bel_pobj car2) (bel_pname partof) (bel_pval lane1))
    (ag_bel (bel_type moment) (bel_pobj car1) (bel_pname partof) (bel_pval lane1))
    (ag_bel (bel_type moment) (bel_pobj car2) (bel_pname type) (bel_pval politie))
    (ag_bel (bel_type moment) (bel_pobj car2) (bel_pname semn_depasire) (bel_pval da))
    (ag_bel (bel_type moment) (bel_pobj car2) (bel_pname partof) (bel_pval coloana1))
    ?f <- (ag_bel (bel_type fluent) (bel_pname coloana_oficiala) (bel_pval yes))
=>
    (retract ?f)
)

(defrule AGENT::pod
    (timp (valoare ?t))
    (ag_bel (bel_type moment) (bel_pobj ev15))
    (ag_bel (bel_type moment) (bel_pobj line1) (bel_pname type) (bel_pval continuous_line))
    (ag_bel (bel_type moment) (bel_pobj car1) (bel_pname partof) (bel_pval lane1))
    (ag_bel (bel_type moment) (bel_pobj parapet1) (bel_pname partof) (bel_pval lane1))
    (ag_bel (bel_type moment) (bel_pobj parapet2) (bel_pname partof) (bel_pval lane2))
    (ag_bel (bel_type moment) (bel_pobj road_sign1) (bel_pname type) (bel_pval river_bridge_name))
=>
    (assert (ag_bel (bel_type fluent) (bel_pname pod) (bel_pval yes)))   
)

(defrule AGENT::sfarsit_pod
    (timp (valoare ?t))
    (ag_bel (bel_type moment) (bel_pobj ev15))
    ?f <- (ag_bel (bel_type fluent) (bel_pname pod) (bel_pval yes))
    (ag_bel (bel_type moment) (bel_pobj road_sign2) (bel_pname type) (bel_pval river_bridge_name))
=>
    (retract ?f)
)

(defrule AGENT::masina_pe_contrasens_distanta_mica
    (timp (valoare ?t))
    (ag_bel (bel_type moment) (bel_pobj ev13))
    (ag_bel (bel_type moment) (bel_pobj car2) (bel_pname partof) (bel_pval lane2))
    (ag_bel (bel_type moment) (bel_pobj car1) (bel_pname partof) (bel_pval lane1))
    (ag_bel (bel_type moment) (bel_pobj car1) (bel_pname distance_to_car2) (bel_pval ?d1))
    (ag_bel (bel_type moment) (bel_pobj line1) (bel_pname type) (bel_pval broken_white_line))
    (test (< ?d1 500)
=>
    (assert (ag_bel (bel_type fluent) (bel_pname masina_pe_contrasens) (bel_pval yes)))
    (printout t "Depasire interzisa, distanta prea mica masina contrasens!" crlf)
)

(defrule AGENT::masina_pe_contrasens_distanta_mare
    (timp (valoare ?t))
    (ag_bel (bel_type moment) (bel_pobj ev13))
    (ag_bel (bel_type moment) (bel_pobj car2) (bel_pname partof) (bel_pval lane2))
    (ag_bel (bel_type moment) (bel_pobj car1) (bel_pname partof) (bel_pval lane1))
    (ag_bel (bel_type moment) (bel_pobj car1) (bel_pname distance_to_car2) (bel_pval ?d1))
    (ag_bel (bel_type moment) (bel_pobj line1) (bel_pname type) (bel_pval broken_white_line))
    ?f <- (ag_bel (bel_type fluent) (bel_pname masina_pe_contrasens) (bel_pval yes))
    (test (>= ?d1 500))
=>
    (retract ?f)
)


(defrule AGENT::cont_necont
     (timp (valoare ?t))
    (ag_bel (bel_type moment) (bel_pobj ev16))
    (ag_bel (bel_type moment) (bel_pobj line1) (bel_pname type) (bel_pval continuous_line))
    (ag_bel (bel_type moment) (bel_pobj line2) (bel_pname type) (bel_pval broken_white_line))
=>
    (assert (ag_bel (bel_type fluent) (bel_pname cont_necont) (bel_pval yes)))
)

(defrule AGENT::necont_cont
     (timp (valoare ?t))
    (ag_bel (bel_type moment) (bel_pobj ev16))
    (ag_bel (bel_type moment) (bel_pobj line1) (bel_pname type) (bel_pval continuous_line))
    (ag_bel (bel_type moment) (bel_pobj line2) (bel_pname type) (bel_pval broken_white_line))
    ?f <- (ag_bel (bel_type fluent) (bel_pname cont_necont) (bel_pval yes))
=>
    (retract ?f)
)

(defrule AGENT::semn_depasire_interzisa
    (timp (valoare ?t))
    (ag_bel (bel_type moment) (bel_pobj ev4))
    (ag_bel (bel_type moment) (bel_pobj road_sign1) (bel_pname type) (bel_pval depasire_interzisa))
=>
    (assert (ag_bel (bel_type fluent) (bel_pname semn_depasire_interzisa) (bel_pval yes)))
)

(defrule AGENT::semn_depasire_permisa
    (timp (valoare ?t))
    (ag_bel (bel_type moment) (bel_pobj ev4))
    (ag_bel (bel_type moment) (bel_pobj road_sign1) (bel_pname type) (bel_pval depasire_permisa))
    ?f <- (ag_bel (bel_type fluent) (bel_pname semn_depasire_interzisa) (bel_pval yes))
=>
    (retract ?f)
)

(defrule AGENT::intersectie_nesemnalizata
    (timp (valoare ?t))
    (ag_bel (bel_type moment) (bel_pobj ev5))
    (ag_bel (bel_type moment) (bel_pobj intersection1) (bel_pname partof) (bel_pval ev5))
    (ag_bel (bel_type moment) (bel_pobj road_sign1) (bel_pname exists) (bel_pval false))
    (ag_bel (bel_type moment) (bel_pobj traffic_light1) (bel_pname intermittent) (bel_pval false))
    (ag_bel (bel_type moment) (bel_pobj officer1) (bel_pname exists) (bel_pval false))
    (test (and (and (eq ?c1 false) (eq ?c2 true)) (eq ?c3 false)))
=>
    (assert (ag_bel (bel_type fluent) (bel_pname intersectie_nesemnalizata) (bel_pval yes)))
)

(defrule AGENT::sfarsit_intersectie_nesemnalizata
    (timp (valoare ?t))
    (ag_bel (bel_type moment) (bel_pobj ev5))
    (ag_bel (bel_type moment) (bel_pobj intersection1) (bel_pname partof) (bel_pval ev5))
    (ag_bel (bel_type moment) (bel_pobj road_sign1) (bel_pname exists) (bel_pval false))
    (ag_bel (bel_type moment) (bel_pobj traffic_light1) (bel_pname intermittent) (bel_pval false))
    (ag_bel (bel_type moment) (bel_pobj officer1) (bel_pname exists) (bel_pval false))
    ?f <- (ag_bel (bel_type fluent) (bel_pname cale_ferat) (bel_pval yes))
    (test (not (and (and (eq ?c1 false) (eq ?c2 true)) (eq ?c3 false))))
=>
    (retract ?f)
)

(defrule AGENT::linie_continua
    (timp (valoare ?t))
    (ag_bel (bel_type moment) (bel_pobj ev6))
    (ag_bel (bel_type moment) (bel_pobj line1) (bel_pname type) (bel_pval continuous_line))
=>
    (assert (ag_bel (bel_type fluent) (bel_pname linie_continua) (bel_pval yes)))
)

(defrule AGENT::linie_continua_sfarsit
    (timp (valoare ?t))
    (ag_bel (bel_type moment) (bel_pobj ev6))
    (ag_bel (bel_type moment) (bel_pobj line1) (bel_pname type) (bel_pval broken_white_line))
    ?f <- (ag_bel (bel_type fluent) (bel_pname linie_continua) (bel_pval yes)))
=>
    (retract ?f)
)

(defrule AGENT::statie_tramvai_fara_refugiu
    (timp (valoare ?t))
    (ag_bel (bel_type moment) (bel_pobj ev7))
    (ag_bel (bel_type moment) (bel_pobj tram1) (bel_pname partof) (bel_pval ?lane2))
    (ag_bel (bel_type moment) (bel_pobj ?lane2) (bel_pname type) (bel_pval basic_lane))
=>
    (assert (ag_bel (bel_type fluent) (bel_pname statie_tramvai_fara_refugiu) (bel_pval yes)))
)

(defrule AGENT::statie_tramvai_fara_refugiu_sfarsit
    (timp (valoare ?t))
    (ag_bel (bel_type moment) (bel_pobj ev7))
    (ag_bel (bel_type moment) (bel_pobj tram1) (bel_pname partof) (bel_pval ?lane2))
    (ag_bel (bel_type moment) (bel_pobj ?lane2) (bel_pname type) (bel_pval basic_lane))
    ?f <- (ag_bel (bel_type fluent) (bel_pname statie_tramvai_fara_refugiu) (bel_pval yes))
=>
    (retract ?f)
)

(defrule AGENT::trecere_pietoni
	(declare (salience 100))
    (timp (valoare ?t))
    (ag_bel (bel_type moment) (bel_pobj ev8))
    (ag_bel (bel_type moment) (bel_pobj road_sign1) (bel_pname type) (bel_pval ?v))
    (test (eq ?v pedestrian_crossing))
=>
	(assert (ag_bel (bel_type fluent) (bel_pname trecere_pietoni) (bel_pval yes)))
    )
)

(defrule AGENT::sfarsit_trecere_pietoni
	(declare (salience 100))
    (timp (valoare ?t))
    (ag_bel (bel_type moment) (bel_pobj ev8))
    (ag_bel (bel_type moment) (bel_pobj road_sign2) (bel_pname type) (bel_pval pedestrian_crossing))
    ?f <- (ag_bel (bel_type fluent) (bel_pname trecere_pietoni) (bel_pval yes))
=>
	(retract ?f)
)


(defrule AGENT::curba
    (timp (valoare ?t))
    (ag_bel (bel_type moment) (bel_pobj ev11))
    (ag_bel (bel_type moment) (bel_pobj road_sign1) (bel_pname type) (bel_pval ?v))
    (test (eq ?v any_turn))
=>
	(assert (ag_bel (bel_type fluent) (bel_pname curba) (bel_pval yes)))
)

(defrule AGENT::final_curba
    (timp (valoare ?t))
    (ag_bel (bel_type moment) (bel_pobj ev11))
    ?f <- (ag_bel (bel_type fluent) (bel_pname curba) (bel_pval yes))
    (ag_bel (bel_type moment) (bel_pobj road_sign2) (bel_pname type) (bel_pval any_turn))
=>
    (retract ?f)
)


(defrule AGENT::final_trecere_pietoni
	(declare (salience -100))
    (timp (valoare ?t))
    (ag_bel (bel_type moment) (bel_pobj ev8))
    ?f <- (ag_bel (bel_type fluent) (bel_pname no-overtaking-zone) (bel_pval yes))
    (ag_bel (bel_type moment) (bel_pobj road_sign2) (bel_pname type) (bel_pval pedestrian_crossing))
=>
    (printout t "Ati trecut de trecerea de pietoni." crlf))
    (assert (ag_bel (bel_type fluent) (bel_pname no-overtaking-zone) (bel_pval no)))
    (retract ?f)
)

(deffunction iesire_tunel(?l1 ?l2)
  (if (< 300 (- ?l2 ?l1))  then (return true)
  						  else (return false)
  )
)

(defrule AGENT::tunel
	(declare (salience 100))
    (timp (valoare ?t))
    (ag_bel (bel_type moment) (bel_pobj ev9))
    (ag_bel (bel_type moment) (bel_pobj road_sign1) (bel_pname type) (bel_pval tunnel))
=>
    (assert (ag_bel (bel_type fluent) (bel_pname tunel) (bel_pval no))))
)

(defrule AGENT::tunel_sfarsit
	(declare (salience 100))
    (timp (valoare ?t))
    (ag_bel (bel_type moment) (bel_pobj ev9))
    (ag_bel (bel_type moment) (bel_pobj road_sign1) (bel_pname type) (bel_pval tunnel))
    ?f <- (ag_bel (bel_type fluent) (bel_pname tunel) (bel_pval no)))
    (test (eq (iesire_tunel ?l1 ?l2) true))
=>
    (retract ?f)
)

(defrule AGENT::final_tunel
	(declare (salience -100))
    (timp (valoare ?t))
    (ag_bel (bel_type moment) (bel_pobj ev9))
    ?f <- (ag_bel (bel_type fluent) (bel_pname no-overtaking-zone) (bel_pval yes))
    (ag_bel (bel_type moment) (bel_pobj tunnel1) (bel_pname luminosity) (bel_pval ?l1))
    (ag_bel (bel_type moment) (bel_pobj tunnel1) (bel_pname luminosity_after_1000ms) (bel_pval ?l2))
    (test (eq (iesire_tunel ?l1 ?l2) true))
=>
    (printout t "Ati iesit din tunel." crlf))
    (assert (ag_bel (bel_type fluent) (bel_pname no-overtaking-zone) (bel_pval no)))
    (retract ?f)
)

(defrule AGENT::pod_mobil
    (timp (valoare ?t))
    (ag_bel (bel_type moment) (bel_pobj ev12))
    (ag_bel (bel_type moment) (bel_pobj road_sign1) (bel_pname type) (bel_pval ?v))
    (test (eq ?v mobile_bridge))
=>
    (assert (ag_bel (bel_type fluent) (bel_pname pod_mobil) (bel_pval yes)))
)

(defrule AGENT::final_pod_mobil
    (timp (valoare ?t))
    (ag_bel (bel_type moment) (bel_pobj ev12))
    ?f <- (ag_bel (bel_type fluent) (bel_pname no-overtaking-zone) (bel_pval yes))
    (ag_bel (bel_type moment) (bel_pobj road_sign2) (bel_pname type) (bel_pval mobile_bridge))
=>
    (retract ?f)
)

(defrule AGENT::vizibilitate_sub50
    (timp (valoare ?t))
    (ag_bel (bel_type moment) (bel_pobj ev10))
    (ag_bel (bel_type moment) (bel_pobj road1) (bel_pname visibility) (bel_pval ?v))
    (test (< ?v 50))
=>
    (assert (ag_bel (bel_type fluent) (bel_pname vizibilitate_sub50) (bel_pval yes)))
)

(defrule AGENT::vizibilitate_peste50
    (timp (valoare ?t))
    (ag_bel (bel_type moment) (bel_pobj ev10))
    (ag_bel (bel_type moment) (bel_pobj road1) (bel_pname visibility) (bel_pval ?v))
    ?f <- (ag_bel (bel_type fluent) (bel_pname vizibilitate_sub50) (bel_pval yes))
    (test (>= ?v 50))
=>
    (retract ?f)
)

;-- TODO: daca am Semn trecere de pietoni (nu marcaj, ci semn!) - switch fluent dupa o anumita distanta parcursa
;-- de abstractizat terminarea parcurgerii distantei 

;-- TODO: marcaj linie continua pe care l-as incalca la repliere - tratare perceptii curente+viitoare
;-- de integrat si in regula validate-overtaking

;-----Validate intention of overtaking: check if there is any restriction ----------
(defrule AGENT::validate-overtaking
    (declare (salience -10))
    ?f <- (ag_bel (bel_type moment) (bel_pname overtaking-maneuver) (bel_pval prohibited))
    ; (not (ag_bel (bel_type fluent) (bel_pname no-overtaking-zone) (bel_pval yes)))
    ; (not (ag_bel (bel_type fluent) (bel_pname cale_ferat) (bel_pval yes)))
    (not (ag_bel (bel_type fluent) (bel_pname coloana_oficiala) (bel_pval yes)))
    (not (ag_bel (bel_type fluent) (bel_pname pod) (bel_pval yes)))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>validate-overtaking NU->DA (nu avem restrictii) " crlf))
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname overtaking-maneuver) (bel_pval allowed)))
    ;(facts AGENT)
)


;;----------------------------------
;;
;;    Right turn
;;
;;----------------------------------

;--- Sign forbidding right turn or forcing either go ahead or left turn
(defrule AGENT::r-no-right-turn-sign
    (timp (valoare ?t))
    (ag_bel (bel_pobj ?ps) (bel_pname isa) (bel_pval road_sign))
    (ag_bel (bel_pobj ?ps) (bel_pname semnificatie) (bel_pval ?v&interzis_viraj_dreapta | obligatoriu_inainte | obligatoriu_stanga | obligatoriu_inainte_stanga))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>r-no-right-turn-sign" crlf))
    (assert (ag_bel (bel_type fluent) (bel_pname no-right-turn-zone) (bel_pval yes)))
    ;(facts AGENT)
)

(defrule AGENT::r-no-right-turn-zone-end
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type fluent) (bel_pname no-right-turn-zone) (bel_pval yes))
    (ag_bel (bel_pobj ?ps) (bel_pname isa) (bel_pval area_limit))
    (ag_bel (bel_pobj ?ps) (bel_pname semnificatie) (bel_pval intersection_end))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>r-no-right-turn-zone-end we crossed an intersection" crlf))
    (retract ?f)
)

 ;--- Sign forbidding access on a street
(defrule AGENT::r-no-access
    (timp (valoare ?t))
    (ag_bel (bel_pobj ?ps) (bel_pname isa) (bel_pval road_sign))
    (ag_bel (bel_pobj ?ps) (bel_pname semnificatie) (bel_pval ?v& accesul_interzis | circulatia_interzisa_in_ambele_sensuri))
    ;;;(ag_bel (bel_pobj ?ps) (bel_pname direction) (bel_pval ?pd& right | left))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>r-no-access" crlf))
    (assert (ag_bel (bel_type moment) (bel_pname no-access) (bel_pval yes)))
    ;(facts AGENT)
)

;-----Validate intention of right-turn: check if there is any restriction ----------
(defrule AGENT::validate-right-turn
    (declare (salience -10))
    ?f <- (ag_bel (bel_type moment) (bel_pname right-turn-maneuver) (bel_pval prohibited))
    (not (ag_bel (bel_type fluent) (bel_pname no-right-turn-zone) (bel_pval yes)))
    ;(not (ag_bel (bel_type moment) (bel_pname no-access) (bel_pval yes) (bel_pdir right)))
    ;; TODO: manage direction
    (not (ag_bel (bel_type moment) (bel_pname no-access) (bel_pval yes)))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>validate-right-turn NU->DA (nu avem restrictii) " crlf))
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname right-turn-maneuver) (bel_pval allowed)))
    ;(facts AGENT)
)


;;----------------------------------
;;
;;    Left turn
;;
;;----------------------------------

;--Sign forbidding access on a street to the left dealt by r-no-access rule
;--continuous line presence checked by rmlc rule
;--TODO: roundabout

;--- Sign forbidding left turn or forcing either go ahead or right turn
(defrule AGENT::r-no-left-turn-sign
    (timp (valoare ?t))
    (ag_bel (bel_pobj ?ps) (bel_pname isa) (bel_pval road_sign))
    (ag_bel (bel_pobj ?ps) (bel_pname semnificatie) (bel_pval ?v&interzis_viraj_stanga | obligatoriu_inainte | obligatoriu_dreapta | obligatoriu_inainte_dreapta | intersectie_cu_sens_giratoriu))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>r-no-left-turn-sign" ?v crlf))
    (assert (ag_bel (bel_type fluent) (bel_pname no-left-turn-zone) (bel_pval yes)))
    ;(facts AGENT)
)

(defrule AGENT::r-no-left-turn-zone-end
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type fluent) (bel_pname no-left-turn-zone) (bel_pval yes))
    (ag_bel (bel_pobj ?ps) (bel_pname isa) (bel_pval area_limit))
    (ag_bel (bel_pobj ?ps) (bel_pname isa) (bel_pval area_limit))
    (ag_bel (bel_pobj ?ps) (bel_pname semnificatie) (bel_pval intersection_end))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>r-no-left-turn-zone-end we crossed an intersection" crlf))
    (retract ?f)
)

;-----Validate intention of left-turn: check if there is any restriction ----------
(defrule AGENT::validate-left-turn
    (declare (salience -10))
    ?f <- (ag_bel (bel_type moment) (bel_pname left-turn-maneuver) (bel_pval prohibited))
    (not (ag_bel (bel_type fluent) (bel_pname no-left-turn-zone) (bel_pval yes)))
    ;(not (ag_bel (bel_type moment) (bel_pname no-access) (bel_pval yes) (bel_pdir left)))
    ;; TODO: manage direction
     (not (ag_bel (bel_type moment) (bel_pname no-access) (bel_pval yes)))
    (not (ag_bel (bel_type moment) (bel_pname continuous-line-marking) (bel_pval yes)))
;roundabout
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>validate-left-turn NU->DA (nu avem restrictii) " crlf))
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname left-turn-maneuver) (bel_pval allowed)))
    ;(facts AGENT)
)



;---------Delete auxiliary facts which are no longer needed ----------
;
; Programmner's task
;
