(ag_percept (percept_pobj ev13) (percept_pname isa) (percept_pval event))
(ag_percept (percept_pobj road1) (percept_pname isa) (percept_pval road))
(ag_percept (percept_pobj lane1) (percept_pname isa) (percept_pval lane))
(ag_percept (percept_pobj lane2) (percept_pname isa) (percept_pval lane))

(ag_percept (percept_pobj road1) (percept_pname partof) (percept_pval ev13))
(ag_percept (percept_pobj lane1) (percept_pname partof) (percept_pval road1))
(ag_percept (percept_pobj lane2) (percept_pname partof) (percept_pval road1))

(ag_percept (percept_pobj car1) (percept_pname isa) (percept_pval car))
(ag_percept (percept_pobj car2) (percept_pname isa) (percept_pval car))

(ag_percept (percept_pobj car1) (percept_pname partof) (percept_pval lane1))
(ag_percept (percept_pobj car2) (percept_pname partof) (percept_pval lane2))

(ag_percept (percept_pobj car1) (percept_pname distance_to_car2) (percept_pval 600))

(ag_percept (percept_pobj line1) (percept_pname partof) (percept_pval road1))
(ag_percept (percept_pobj line1) (percept_pname type) (percept_pval continuous_line))