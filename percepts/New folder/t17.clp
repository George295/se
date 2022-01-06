(ag_percept (percept_pobj ev14) (percept_pname isa) (percept_pval event))
(ag_percept (percept_pobj road1) (percept_pname isa) (percept_pval road))
(ag_percept (percept_pobj lane1) (percept_pname isa) (percept_pval lane))
(ag_percept (percept_pobj coloana1) (percept_pname isa) (percept_pval coloana))

(ag_percept (percept_pobj road1) (percept_pname partof) (percept_pval ev14))
(ag_percept (percept_pobj coloana1) (percept_pname partof) (percept_pval road1))
(ag_percept (percept_pobj lane1) (percept_pname partof) (percept_pval road1))

(ag_percept (percept_pobj car1) (percept_pname isa) (percept_pval car))
(ag_percept (percept_pobj car2) (percept_pname isa) (percept_pval car))
(ag_percept (percept_pobj car1) (percept_pname partof) (percept_pval lane1))
(ag_percept (percept_pobj car2) (percept_pname partof) (percept_pval lane1))
(ag_percept (percept_pobj car2) (percept_pname partof) (percept_pval coloana1))
(ag_percept (percept_pobj car2) (percept_pname type) (percept_pval politie))

(ag_percept (percept_pobj car2) (percept_pname semn_depasire) (percept_pval nu))