;
;----------Modul: MAIN-------------
;
(defmodule MAIN
    (export deftemplate initial-fact)
    (export deftemplate tic)
)

(deftemplate MAIN::tic)

(defglobal ?*main-in-debug* = FALSE)
;(defglobal ?*main-in-debug* = TRUE)
(defglobal ?*ag-tic-in-debug* = FALSE)
;(defglobal ?*ag-tic-in-debug* = TRUE)


(defglobal ?*totalNrRules* = 270)

;
;----------Modul: PERCEPT-MANAGER-----------
;
(defmodule PERCEPT-MANAGER
 (import MAIN deftemplate initial-fact)
 (import MAIN deftemplate tic)
 (export deftemplate timp)
 (export deftemplate ag_percept)
)


(defglobal ?*sim-in-debug* = FALSE)
;(defglobal ?*sim-in-debug* = TRUE)
(defglobal ?*percepts-in-debug* = FALSE)
;(defglobal ?*percepts-in-debug* = TRUE)
(defglobal ?*perceptsDir* = "./percepts/sc2/")


(deftemplate PERCEPT-MANAGER::timp (slot valoare))

(deftemplate PERCEPT-MANAGER::ag_percept
    (slot percept_pname)
    (slot percept_pval)
    (slot percept_pobj))

;
;-------------Modul: DRIVER-AGENT
;
(defmodule AGENT
    (import MAIN deftemplate initial-fact)
    (import PERCEPT-MANAGER deftemplate timp)
    (import PERCEPT-MANAGER deftemplate ag_percept)
)

(defglobal ?*ag-in-debug* = FALSE)
;(defglobal ?*ag-in-debug* = TRUE)
(defglobal ?*ag-percepts-in-debug* = FALSE)
;(defglobal ?*ag-percepts-in-debug* = TRUE)

(defglobal ?*ag-measure-time* = FALSE)
;(defglobal ?*ag-measure-time* = TRUE)

(deftemplate ag_bel
    (slot bel_type) ; fluent|moment
    (slot bel_pname) ; which property we're talking about: overtaking-maneuver|no-overtaking-zone|speed_limit
    (slot bel_pval) ; bel_pname value: (prohibited|allowed) or (yes|no) or (50|90|100|130)
    (slot bel_pobj)
)
