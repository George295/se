(ag_percept (percept_pobj ev1) (percept_pname isa) (percept_pval event))
(ag_percept (percept_pobj road1) (percept_pname isa) (percept_pval road))
(ag_percept (percept_pobj lane1) (percept_pname isa) (percept_pval lane))
(ag_percept (percept_pobj lane2) (percept_pname isa) (percept_pval lane))
(ag_percept (percept_pobj railroad1) (percept_pname isa) (percept_pval railroad))
(ag_percept (percept_pobj road_sign1) (percept_pname isa) (percept_pval road_sign))
(ag_percept (percept_pobj road_sign2) (percept_pname isa) (percept_pval road_sign))
(ag_percept (percept_pobj my_car) (percept_pname isa) (percept_pval car))

(ag_percept (percept_pobj road1) (percept_pname partof) (percept_pval ev1))
(ag_percept (percept_pobj lane1) (percept_pname partof) (percept_pval road1))
(ag_percept (percept_pobj lane2) (percept_pname partof) (percept_pval road1))
(ag_percept (percept_pobj railroad1) (percept_pname partof) (percept_pval road1))
(ag_percept (percept_pobj road_sign1) (percept_pname partof) (percept_pval lane1))
(ag_percept (percept_pobj road_sign2) (percept_pname partof) (percept_pval lane2))

(ag_percept (percept_pobj road_sign1) (percept_pname type) (percept_pval railroad))
(ag_percept (percept_pobj road_sign2) (percept_pname type) (percept_pval railroad))

(ag_percept (percept_pobj railroad1) (percept_pname distance_to_my_car) (percept_pval 40))