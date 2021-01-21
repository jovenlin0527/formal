(* This file is generated by Why3's Coq driver *)
(* Beware! Only edit allowed sections below    *)
Require Import BuiltIn.
Require BuiltIn.
Require HighOrd.
Require bool.Bool.
Require int.Int.
Require int.Abs.
Require int.ComputerDivision.
Require real.Real.
Require real.RealInfix.
Require real.FromInt.
Require map.Map.

Parameter eqb:
  forall {a:Type} {a_WT:WhyType a}, a -> a -> Init.Datatypes.bool.

Axiom eqb1 :
  forall {a:Type} {a_WT:WhyType a},
  forall (x:a) (y:a), ((eqb x y) = Init.Datatypes.true) <-> (x = y).

Axiom eqb_false :
  forall {a:Type} {a_WT:WhyType a},
  forall (x:a) (y:a), ((eqb x y) = Init.Datatypes.false) <-> ~ (x = y).

Parameter neqb:
  forall {a:Type} {a_WT:WhyType a}, a -> a -> Init.Datatypes.bool.

Axiom neqb1 :
  forall {a:Type} {a_WT:WhyType a},
  forall (x:a) (y:a), ((neqb x y) = Init.Datatypes.true) <-> ~ (x = y).

Parameter zlt: Numbers.BinNums.Z -> Numbers.BinNums.Z -> Init.Datatypes.bool.

Parameter zleq:
  Numbers.BinNums.Z -> Numbers.BinNums.Z -> Init.Datatypes.bool.

Axiom zlt1 :
  forall (x:Numbers.BinNums.Z) (y:Numbers.BinNums.Z),
  ((zlt x y) = Init.Datatypes.true) <-> (x < y)%Z.

Axiom zleq1 :
  forall (x:Numbers.BinNums.Z) (y:Numbers.BinNums.Z),
  ((zleq x y) = Init.Datatypes.true) <-> (x <= y)%Z.

Parameter rlt:
  Reals.Rdefinitions.R -> Reals.Rdefinitions.R -> Init.Datatypes.bool.

Parameter rleq:
  Reals.Rdefinitions.R -> Reals.Rdefinitions.R -> Init.Datatypes.bool.

Axiom rlt1 :
  forall (x:Reals.Rdefinitions.R) (y:Reals.Rdefinitions.R),
  ((rlt x y) = Init.Datatypes.true) <-> (x < y)%R.

Axiom rleq1 :
  forall (x:Reals.Rdefinitions.R) (y:Reals.Rdefinitions.R),
  ((rleq x y) = Init.Datatypes.true) <-> (x <= y)%R.

(* Why3 assumption *)
Definition real_of_int (x:Numbers.BinNums.Z) : Reals.Rdefinitions.R :=
  BuiltIn.IZR x.

Axiom c_euclidian :
  forall (n:Numbers.BinNums.Z) (d:Numbers.BinNums.Z), ~ (d = 0%Z) ->
  (n = (((ZArith.BinInt.Z.quot n d) * d)%Z + (ZArith.BinInt.Z.rem n d))%Z).

Axiom cmod_remainder :
  forall (n:Numbers.BinNums.Z) (d:Numbers.BinNums.Z),
  ((0%Z <= n)%Z -> (0%Z < d)%Z ->
   (0%Z <= (ZArith.BinInt.Z.rem n d))%Z /\ ((ZArith.BinInt.Z.rem n d) < d)%Z) /\
  ((n <= 0%Z)%Z -> (0%Z < d)%Z ->
   ((-d)%Z < (ZArith.BinInt.Z.rem n d))%Z /\
   ((ZArith.BinInt.Z.rem n d) <= 0%Z)%Z) /\
  ((0%Z <= n)%Z -> (d < 0%Z)%Z ->
   (0%Z <= (ZArith.BinInt.Z.rem n d))%Z /\
   ((ZArith.BinInt.Z.rem n d) < (-d)%Z)%Z) /\
  ((n <= 0%Z)%Z -> (d < 0%Z)%Z ->
   (d < (ZArith.BinInt.Z.rem n d))%Z /\ ((ZArith.BinInt.Z.rem n d) <= 0%Z)%Z).

Axiom cdiv_neutral :
  forall (a:Numbers.BinNums.Z), ((ZArith.BinInt.Z.quot a 1%Z) = a).

Axiom cdiv_inv :
  forall (a:Numbers.BinNums.Z), ~ (a = 0%Z) ->
  ((ZArith.BinInt.Z.quot a a) = 1%Z).

Axiom cdiv_closed_remainder :
  forall (a:Numbers.BinNums.Z) (b:Numbers.BinNums.Z) (n:Numbers.BinNums.Z),
  (0%Z <= a)%Z -> (0%Z <= b)%Z ->
  (0%Z <= (b - a)%Z)%Z /\ ((b - a)%Z < n)%Z ->
  ((ZArith.BinInt.Z.rem a n) = (ZArith.BinInt.Z.rem b n)) -> (a = b).

(* Why3 assumption *)
Inductive addr :=
  | addr'mk : Numbers.BinNums.Z -> Numbers.BinNums.Z -> addr.
Axiom addr_WhyType : WhyType addr.
Existing Instance addr_WhyType.

(* Why3 assumption *)
Definition offset (v:addr) : Numbers.BinNums.Z :=
  match v with
  | addr'mk x x1 => x1
  end.

(* Why3 assumption *)
Definition base (v:addr) : Numbers.BinNums.Z :=
  match v with
  | addr'mk x x1 => x
  end.

Parameter addr_le: addr -> addr -> Prop.

Parameter addr_lt: addr -> addr -> Prop.

Parameter addr_le_bool: addr -> addr -> Init.Datatypes.bool.

Parameter addr_lt_bool: addr -> addr -> Init.Datatypes.bool.

Axiom addr_le_def :
  forall (p:addr) (q:addr), ((base p) = (base q)) ->
  addr_le p q <-> ((offset p) <= (offset q))%Z.

Axiom addr_lt_def :
  forall (p:addr) (q:addr), ((base p) = (base q)) ->
  addr_lt p q <-> ((offset p) < (offset q))%Z.

Axiom addr_le_bool_def :
  forall (p:addr) (q:addr),
  addr_le p q <-> ((addr_le_bool p q) = Init.Datatypes.true).

Axiom addr_lt_bool_def :
  forall (p:addr) (q:addr),
  addr_lt p q <-> ((addr_lt_bool p q) = Init.Datatypes.true).

(* Why3 assumption *)
Definition null : addr := addr'mk 0%Z 0%Z.

(* Why3 assumption *)
Definition global (b:Numbers.BinNums.Z) : addr := addr'mk b 0%Z.

(* Why3 assumption *)
Definition shift (p:addr) (k:Numbers.BinNums.Z) : addr :=
  addr'mk (base p) ((offset p) + k)%Z.

(* Why3 assumption *)
Definition included (p:addr) (a:Numbers.BinNums.Z) (q:addr)
    (b:Numbers.BinNums.Z) : Prop :=
  (0%Z < a)%Z ->
  (0%Z <= b)%Z /\
  ((base p) = (base q)) /\
  ((offset q) <= (offset p))%Z /\
  (((offset p) + a)%Z <= ((offset q) + b)%Z)%Z.

(* Why3 assumption *)
Definition separated (p:addr) (a:Numbers.BinNums.Z) (q:addr)
    (b:Numbers.BinNums.Z) : Prop :=
  (a <= 0%Z)%Z \/
  (b <= 0%Z)%Z \/
  ~ ((base p) = (base q)) \/
  (((offset q) + b)%Z <= (offset p))%Z \/
  (((offset p) + a)%Z <= (offset q))%Z.

(* Why3 assumption *)
Definition eqmem {a:Type} {a_WT:WhyType a} (m1:addr -> a) (m2:addr -> a)
    (p:addr) (a1:Numbers.BinNums.Z) : Prop :=
  forall (q:addr), included q 1%Z p a1 -> ((m1 q) = (m2 q)).

Parameter havoc:
  forall {a:Type} {a_WT:WhyType a}, (addr -> a) -> (addr -> a) -> addr ->
  Numbers.BinNums.Z -> addr -> a.

(* Why3 assumption *)
Definition valid_rw (m:Numbers.BinNums.Z -> Numbers.BinNums.Z) (p:addr)
    (n:Numbers.BinNums.Z) : Prop :=
  (0%Z < n)%Z ->
  (0%Z < (base p))%Z /\
  (0%Z <= (offset p))%Z /\ (((offset p) + n)%Z <= (m (base p)))%Z.

(* Why3 assumption *)
Definition valid_rd (m:Numbers.BinNums.Z -> Numbers.BinNums.Z) (p:addr)
    (n:Numbers.BinNums.Z) : Prop :=
  (0%Z < n)%Z ->
  ~ (0%Z = (base p)) /\
  (0%Z <= (offset p))%Z /\ (((offset p) + n)%Z <= (m (base p)))%Z.

(* Why3 assumption *)
Definition valid_obj (m:Numbers.BinNums.Z -> Numbers.BinNums.Z) (p:addr)
    (n:Numbers.BinNums.Z) : Prop :=
  (0%Z < n)%Z ->
  (p = null) \/
  ~ (0%Z = (base p)) /\
  (0%Z <= (offset p))%Z /\ (((offset p) + n)%Z <= (1%Z + (m (base p)))%Z)%Z.

(* Why3 assumption *)
Definition invalid (m:Numbers.BinNums.Z -> Numbers.BinNums.Z) (p:addr)
    (n:Numbers.BinNums.Z) : Prop :=
  (0%Z < n)%Z ->
  ((m (base p)) <= (offset p))%Z \/ (((offset p) + n)%Z <= 0%Z)%Z.

Axiom valid_rw_rd :
  forall (m:Numbers.BinNums.Z -> Numbers.BinNums.Z), forall (p:addr),
  forall (n:Numbers.BinNums.Z), valid_rw m p n -> valid_rd m p n.

Axiom valid_string :
  forall (m:Numbers.BinNums.Z -> Numbers.BinNums.Z), forall (p:addr),
  ((base p) < 0%Z)%Z ->
  (0%Z <= (offset p))%Z /\ ((offset p) < (m (base p)))%Z ->
  valid_rd m p 1%Z /\ ~ valid_rw m p 1%Z.

Axiom separated_1 :
  forall (p:addr) (q:addr),
  forall (a:Numbers.BinNums.Z) (b:Numbers.BinNums.Z) (i:Numbers.BinNums.Z)
    (j:Numbers.BinNums.Z),
  separated p a q b -> ((offset p) <= i)%Z /\ (i < ((offset p) + a)%Z)%Z ->
  ((offset q) <= j)%Z /\ (j < ((offset q) + b)%Z)%Z ->
  ~ ((addr'mk (base p) i) = (addr'mk (base q) j)).

Parameter region: Numbers.BinNums.Z -> Numbers.BinNums.Z.

Parameter linked: (Numbers.BinNums.Z -> Numbers.BinNums.Z) -> Prop.

Parameter sconst: (addr -> Numbers.BinNums.Z) -> Prop.

(* Why3 assumption *)
Definition framed (m:addr -> addr) : Prop :=
  forall (p:addr), ((region (base (m p))) <= 0%Z)%Z.

Axiom separated_included :
  forall (p:addr) (q:addr),
  forall (a:Numbers.BinNums.Z) (b:Numbers.BinNums.Z), (0%Z < a)%Z ->
  (0%Z < b)%Z -> separated p a q b -> ~ included p a q b.

Axiom included_trans :
  forall (p:addr) (q:addr) (r:addr),
  forall (a:Numbers.BinNums.Z) (b:Numbers.BinNums.Z) (c:Numbers.BinNums.Z),
  included p a q b -> included q b r c -> included p a r c.

Axiom separated_trans :
  forall (p:addr) (q:addr) (r:addr),
  forall (a:Numbers.BinNums.Z) (b:Numbers.BinNums.Z) (c:Numbers.BinNums.Z),
  included p a q b -> separated q b r c -> separated p a r c.

Axiom separated_sym :
  forall (p:addr) (q:addr),
  forall (a:Numbers.BinNums.Z) (b:Numbers.BinNums.Z),
  separated p a q b <-> separated q b p a.

Axiom eqmem_included :
  forall {a:Type} {a_WT:WhyType a},
  forall (m1:addr -> a) (m2:addr -> a), forall (p:addr) (q:addr),
  forall (a1:Numbers.BinNums.Z) (b:Numbers.BinNums.Z), included p a1 q b ->
  eqmem m1 m2 q b -> eqmem m1 m2 p a1.

Axiom eqmem_sym :
  forall {a:Type} {a_WT:WhyType a},
  forall (m1:addr -> a) (m2:addr -> a), forall (p:addr),
  forall (a1:Numbers.BinNums.Z), eqmem m1 m2 p a1 -> eqmem m2 m1 p a1.

Axiom havoc_access :
  forall {a:Type} {a_WT:WhyType a},
  forall (m0:addr -> a) (m1:addr -> a), forall (q:addr) (p:addr),
  forall (a1:Numbers.BinNums.Z),
  (separated q 1%Z p a1 -> ((havoc m0 m1 p a1 q) = (m1 q))) /\
  (~ separated q 1%Z p a1 -> ((havoc m0 m1 p a1 q) = (m0 q))).

Parameter cinits: (addr -> Init.Datatypes.bool) -> Prop.

(* Why3 assumption *)
Definition is_init_range (m:addr -> Init.Datatypes.bool) (p:addr)
    (l:Numbers.BinNums.Z) : Prop :=
  forall (i:Numbers.BinNums.Z), (0%Z <= i)%Z /\ (i < l)%Z ->
  ((m (shift p i)) = Init.Datatypes.true).

Parameter set_init:
  (addr -> Init.Datatypes.bool) -> addr -> Numbers.BinNums.Z ->
  addr -> Init.Datatypes.bool.

Axiom set_init_access :
  forall (m:addr -> Init.Datatypes.bool), forall (q:addr) (p:addr),
  forall (a:Numbers.BinNums.Z),
  (separated q 1%Z p a -> ((set_init m p a q) = (m q))) /\
  (~ separated q 1%Z p a -> ((set_init m p a q) = Init.Datatypes.true)).

(* Why3 assumption *)
Definition monotonic_init (m1:addr -> Init.Datatypes.bool)
    (m2:addr -> Init.Datatypes.bool) : Prop :=
  forall (p:addr), ((m1 p) = Init.Datatypes.true) ->
  ((m2 p) = Init.Datatypes.true).

Parameter int_of_addr: addr -> Numbers.BinNums.Z.

Parameter addr_of_int: Numbers.BinNums.Z -> addr.

Axiom table : Type.
Parameter table_WhyType : WhyType table.
Existing Instance table_WhyType.

Parameter table_of_base: Numbers.BinNums.Z -> table.

Parameter table_to_offset: table -> Numbers.BinNums.Z -> Numbers.BinNums.Z.

Axiom table_to_offset_zero :
  forall (t:table), ((table_to_offset t 0%Z) = 0%Z).

Axiom table_to_offset_monotonic :
  forall (t:table), forall (o1:Numbers.BinNums.Z) (o2:Numbers.BinNums.Z),
  (o1 <= o2)%Z <-> ((table_to_offset t o1) <= (table_to_offset t o2))%Z.

Axiom int_of_addr_bijection :
  forall (a:Numbers.BinNums.Z), ((int_of_addr (addr_of_int a)) = a).

Axiom addr_of_int_bijection :
  forall (p:addr), ((addr_of_int (int_of_addr p)) = p).

Axiom addr_of_null : ((int_of_addr null) = 0%Z).

(* Why3 assumption *)
Definition is_bool (x:Numbers.BinNums.Z) : Prop := (x = 0%Z) \/ (x = 1%Z).

(* Why3 assumption *)
Definition is_uint8 (x:Numbers.BinNums.Z) : Prop :=
  (0%Z <= x)%Z /\ (x < 256%Z)%Z.

(* Why3 assumption *)
Definition is_sint8 (x:Numbers.BinNums.Z) : Prop :=
  ((-128%Z)%Z <= x)%Z /\ (x < 128%Z)%Z.

(* Why3 assumption *)
Definition is_uint16 (x:Numbers.BinNums.Z) : Prop :=
  (0%Z <= x)%Z /\ (x < 65536%Z)%Z.

(* Why3 assumption *)
Definition is_sint16 (x:Numbers.BinNums.Z) : Prop :=
  ((-32768%Z)%Z <= x)%Z /\ (x < 32768%Z)%Z.

(* Why3 assumption *)
Definition is_uint32 (x:Numbers.BinNums.Z) : Prop :=
  (0%Z <= x)%Z /\ (x < 4294967296%Z)%Z.

(* Why3 assumption *)
Definition is_sint32 (x:Numbers.BinNums.Z) : Prop :=
  ((-2147483648%Z)%Z <= x)%Z /\ (x < 2147483648%Z)%Z.

(* Why3 assumption *)
Definition is_uint64 (x:Numbers.BinNums.Z) : Prop :=
  (0%Z <= x)%Z /\ (x < 18446744073709551616%Z)%Z.

(* Why3 assumption *)
Definition is_sint64 (x:Numbers.BinNums.Z) : Prop :=
  ((-9223372036854775808%Z)%Z <= x)%Z /\ (x < 9223372036854775808%Z)%Z.

Axiom is_bool0 : is_bool 0%Z.

Axiom is_bool1 : is_bool 1%Z.

Parameter to_bool: Numbers.BinNums.Z -> Numbers.BinNums.Z.

Axiom to_bool'def :
  forall (x:Numbers.BinNums.Z),
  ((x = 0%Z) -> ((to_bool x) = 0%Z)) /\ (~ (x = 0%Z) -> ((to_bool x) = 1%Z)).

Parameter to_uint8: Numbers.BinNums.Z -> Numbers.BinNums.Z.

Parameter to_sint8: Numbers.BinNums.Z -> Numbers.BinNums.Z.

Parameter to_uint16: Numbers.BinNums.Z -> Numbers.BinNums.Z.

Parameter to_sint16: Numbers.BinNums.Z -> Numbers.BinNums.Z.

Parameter to_uint32: Numbers.BinNums.Z -> Numbers.BinNums.Z.

Parameter to_sint32: Numbers.BinNums.Z -> Numbers.BinNums.Z.

Parameter to_uint64: Numbers.BinNums.Z -> Numbers.BinNums.Z.

Parameter to_sint64: Numbers.BinNums.Z -> Numbers.BinNums.Z.

Parameter two_power_abs: Numbers.BinNums.Z -> Numbers.BinNums.Z.

Axiom two_power_abs_is_positive :
  forall (n:Numbers.BinNums.Z), (0%Z < (two_power_abs n))%Z.

Axiom two_power_abs_plus_pos :
  forall (n:Numbers.BinNums.Z) (m:Numbers.BinNums.Z), (0%Z <= n)%Z ->
  (0%Z <= m)%Z ->
  ((two_power_abs (n + m)%Z) = ((two_power_abs n) * (two_power_abs m))%Z).

Axiom two_power_abs_plus_one :
  forall (n:Numbers.BinNums.Z), (0%Z <= n)%Z ->
  ((two_power_abs (n + 1%Z)%Z) = (2%Z * (two_power_abs n))%Z).

(* Why3 assumption *)
Definition is_uint (n:Numbers.BinNums.Z) (x:Numbers.BinNums.Z) : Prop :=
  (0%Z <= x)%Z /\ (x < (two_power_abs n))%Z.

(* Why3 assumption *)
Definition is_sint (n:Numbers.BinNums.Z) (x:Numbers.BinNums.Z) : Prop :=
  ((-(two_power_abs n))%Z <= x)%Z /\ (x < (two_power_abs n))%Z.

Parameter to_uint:
  Numbers.BinNums.Z -> Numbers.BinNums.Z -> Numbers.BinNums.Z.

Parameter to_sint:
  Numbers.BinNums.Z -> Numbers.BinNums.Z -> Numbers.BinNums.Z.

Axiom is_to_uint :
  forall (n:Numbers.BinNums.Z) (x:Numbers.BinNums.Z), is_uint n (to_uint n x).

Axiom is_to_sint :
  forall (n:Numbers.BinNums.Z) (x:Numbers.BinNums.Z), is_sint n (to_sint n x).

Axiom is_to_uint8 : forall (x:Numbers.BinNums.Z), is_uint8 (to_uint8 x).

Axiom is_to_sint8 : forall (x:Numbers.BinNums.Z), is_sint8 (to_sint8 x).

Axiom is_to_uint16 : forall (x:Numbers.BinNums.Z), is_uint16 (to_uint16 x).

Axiom is_to_sint16 : forall (x:Numbers.BinNums.Z), is_sint16 (to_sint16 x).

Axiom is_to_uint32 : forall (x:Numbers.BinNums.Z), is_uint32 (to_uint32 x).

Axiom is_to_sint32 : forall (x:Numbers.BinNums.Z), is_sint32 (to_sint32 x).

Axiom is_to_uint64 : forall (x:Numbers.BinNums.Z), is_uint64 (to_uint64 x).

Axiom is_to_sint64 : forall (x:Numbers.BinNums.Z), is_sint64 (to_sint64 x).

Axiom id_uint :
  forall (n:Numbers.BinNums.Z) (x:Numbers.BinNums.Z),
  is_uint n x <-> ((to_uint n x) = x).

Axiom id_sint :
  forall (n:Numbers.BinNums.Z) (x:Numbers.BinNums.Z),
  is_sint n x <-> ((to_sint n x) = x).

Axiom id_uint8 :
  forall (x:Numbers.BinNums.Z), is_uint8 x -> ((to_uint8 x) = x).

Axiom id_sint8 :
  forall (x:Numbers.BinNums.Z), is_sint8 x -> ((to_sint8 x) = x).

Axiom id_uint16 :
  forall (x:Numbers.BinNums.Z), is_uint16 x -> ((to_uint16 x) = x).

Axiom id_sint16 :
  forall (x:Numbers.BinNums.Z), is_sint16 x -> ((to_sint16 x) = x).

Axiom id_uint32 :
  forall (x:Numbers.BinNums.Z), is_uint32 x -> ((to_uint32 x) = x).

Axiom id_sint32 :
  forall (x:Numbers.BinNums.Z), is_sint32 x -> ((to_sint32 x) = x).

Axiom id_uint64 :
  forall (x:Numbers.BinNums.Z), is_uint64 x -> ((to_uint64 x) = x).

Axiom id_sint64 :
  forall (x:Numbers.BinNums.Z), is_sint64 x -> ((to_sint64 x) = x).

Axiom proj_uint :
  forall (n:Numbers.BinNums.Z) (x:Numbers.BinNums.Z),
  ((to_uint n (to_uint n x)) = (to_uint n x)).

Axiom proj_sint :
  forall (n:Numbers.BinNums.Z) (x:Numbers.BinNums.Z),
  ((to_sint n (to_sint n x)) = (to_sint n x)).

Axiom proj_uint8 :
  forall (x:Numbers.BinNums.Z), ((to_uint8 (to_uint8 x)) = (to_uint8 x)).

Axiom proj_sint8 :
  forall (x:Numbers.BinNums.Z), ((to_sint8 (to_sint8 x)) = (to_sint8 x)).

Axiom proj_uint16 :
  forall (x:Numbers.BinNums.Z), ((to_uint16 (to_uint16 x)) = (to_uint16 x)).

Axiom proj_sint16 :
  forall (x:Numbers.BinNums.Z), ((to_sint16 (to_sint16 x)) = (to_sint16 x)).

Axiom proj_uint32 :
  forall (x:Numbers.BinNums.Z), ((to_uint32 (to_uint32 x)) = (to_uint32 x)).

Axiom proj_sint32 :
  forall (x:Numbers.BinNums.Z), ((to_sint32 (to_sint32 x)) = (to_sint32 x)).

Axiom proj_uint64 :
  forall (x:Numbers.BinNums.Z), ((to_uint64 (to_uint64 x)) = (to_uint64 x)).

Axiom proj_sint64 :
  forall (x:Numbers.BinNums.Z), ((to_sint64 (to_sint64 x)) = (to_sint64 x)).

Axiom proj_su :
  forall (n:Numbers.BinNums.Z) (x:Numbers.BinNums.Z),
  ((to_sint n (to_uint n x)) = (to_uint n x)).

Axiom incl_su :
  forall (n:Numbers.BinNums.Z) (x:Numbers.BinNums.Z), is_uint n x ->
  is_sint n x.

Axiom proj_su_uint :
  forall (n:Numbers.BinNums.Z) (m:Numbers.BinNums.Z) (x:Numbers.BinNums.Z),
  (0%Z <= n)%Z -> (0%Z <= m)%Z ->
  ((to_sint (m + n)%Z (to_uint n x)) = (to_uint n x)).

Axiom proj_su_sint :
  forall (n:Numbers.BinNums.Z) (m:Numbers.BinNums.Z) (x:Numbers.BinNums.Z),
  (0%Z <= n)%Z -> (0%Z <= m)%Z ->
  ((to_sint n (to_uint (m + (n + 1%Z)%Z)%Z x)) = (to_sint n x)).

Axiom proj_int8 :
  forall (x:Numbers.BinNums.Z), ((to_sint8 (to_uint8 x)) = (to_sint8 x)).

Axiom proj_int16 :
  forall (x:Numbers.BinNums.Z), ((to_sint16 (to_uint16 x)) = (to_sint16 x)).

Axiom proj_int32 :
  forall (x:Numbers.BinNums.Z), ((to_sint32 (to_uint32 x)) = (to_sint32 x)).

Axiom proj_int64 :
  forall (x:Numbers.BinNums.Z), ((to_sint64 (to_uint64 x)) = (to_sint64 x)).

Axiom proj_us_uint :
  forall (n:Numbers.BinNums.Z) (m:Numbers.BinNums.Z) (x:Numbers.BinNums.Z),
  (0%Z <= n)%Z -> (0%Z <= m)%Z ->
  ((to_uint (n + 1%Z)%Z (to_sint (m + n)%Z x)) = (to_uint (n + 1%Z)%Z x)).

Axiom incl_uint :
  forall (n:Numbers.BinNums.Z) (x:Numbers.BinNums.Z) (i:Numbers.BinNums.Z),
  (0%Z <= n)%Z -> (0%Z <= i)%Z -> is_uint n x -> is_uint (n + i)%Z x.

Axiom incl_sint :
  forall (n:Numbers.BinNums.Z) (x:Numbers.BinNums.Z) (i:Numbers.BinNums.Z),
  (0%Z <= n)%Z -> (0%Z <= i)%Z -> is_sint n x -> is_sint (n + i)%Z x.

Axiom incl_int :
  forall (n:Numbers.BinNums.Z) (x:Numbers.BinNums.Z) (i:Numbers.BinNums.Z),
  (0%Z <= n)%Z -> (0%Z <= i)%Z -> is_uint n x -> is_sint (n + i)%Z x.

Parameter L_count_elem:
  (addr -> Numbers.BinNums.Z) -> Numbers.BinNums.Z -> addr ->
  Numbers.BinNums.Z -> Numbers.BinNums.Z.

(* Why3 assumption *)
Definition is_sint32_chunk (m:addr -> Numbers.BinNums.Z) : Prop :=
  forall (a:addr), is_sint32 (m a).

Axiom Q_empty :
  forall (Mint:addr -> Numbers.BinNums.Z) (elem:Numbers.BinNums.Z) (arr:addr)
    (e:Numbers.BinNums.Z),
  (e <= 0%Z)%Z -> is_sint32_chunk Mint -> is_sint32 elem ->
  ((L_count_elem Mint elem arr e) = 0%Z).

Axiom Q_append_eq :
  forall (Mint:addr -> Numbers.BinNums.Z) (elem:Numbers.BinNums.Z) (arr:addr)
    (e:Numbers.BinNums.Z),
  let x := Mint (shift arr e) in
  (x = elem) -> (0%Z <= e)%Z -> is_sint32_chunk Mint -> is_sint32 elem ->
  is_sint32 x ->
  ((1%Z + (L_count_elem Mint elem arr e))%Z =
   (L_count_elem Mint elem arr (1%Z + e)%Z)).

Axiom Q_append_neq :
  forall (Mint:addr -> Numbers.BinNums.Z) (elem:Numbers.BinNums.Z) (arr:addr)
    (e:Numbers.BinNums.Z),
  let x := Mint (shift arr e) in
  ~ (x = elem) -> (0%Z <= e)%Z -> is_sint32_chunk Mint -> is_sint32 elem ->
  is_sint32 x ->
  ((L_count_elem Mint elem arr (1%Z + e)%Z) = (L_count_elem Mint elem arr e)).

(* Why3 assumption *)
Definition P_count_combine (Mint:addr -> Numbers.BinNums.Z) (a1:addr)
    (size1:Numbers.BinNums.Z) (a2:addr) (size2:Numbers.BinNums.Z)
    (out:addr) : Prop :=
  forall (i:Numbers.BinNums.Z), is_sint32 i ->
  (((L_count_elem Mint i a1 size1) + (L_count_elem Mint i a2 size2))%Z =
   (L_count_elem Mint i out (size1 + size2)%Z)).

(* Why3 assumption *)
Definition P_permutation (Mint:addr -> Numbers.BinNums.Z)
    (Mint1:addr -> Numbers.BinNums.Z) (arr1:addr) (arr2:addr)
    (e:Numbers.BinNums.Z) : Prop :=
  forall (i:Numbers.BinNums.Z), is_sint32 i ->
  ((L_count_elem Mint1 i arr1 e) = (L_count_elem Mint i arr2 e)).

(* Why3 assumption *)
Definition P_same_array (Mint:addr -> Numbers.BinNums.Z)
    (Mint1:addr -> Numbers.BinNums.Z) (arr1:addr) (arr2:addr)
    (e:Numbers.BinNums.Z) : Prop :=
  forall (i:Numbers.BinNums.Z), (0%Z <= i)%Z -> (i < e)%Z ->
  ((Mint1 (shift arr1 i)) = (Mint (shift arr2 i))).

(* Why3 assumption *)
Definition P_sorted (Mint:addr -> Numbers.BinNums.Z) (arr:addr)
    (len:Numbers.BinNums.Z) : Prop :=
  forall (i:Numbers.BinNums.Z), (0%Z <= i)%Z -> ((2%Z + i)%Z <= len)%Z ->
  ((Mint (shift arr i)) <= (Mint (shift arr (1%Z + i)%Z)))%Z.

Axiom Q_count_combine_append_1 :
  forall (Mint:addr -> Numbers.BinNums.Z) (a1:addr) (a2:addr) (out:addr)
    (size1:Numbers.BinNums.Z) (size2:Numbers.BinNums.Z),
  let x := Mint (shift out (size1 + size2)%Z) in
  let x1 := Mint (shift a1 size1) in
  (x = x1) -> (0%Z <= size1)%Z -> (0%Z <= size2)%Z -> is_sint32_chunk Mint ->
  is_sint32 x1 -> P_count_combine Mint a1 size1 a2 size2 out ->
  is_sint32 x -> P_count_combine Mint a1 (1%Z + size1)%Z a2 size2 out.

Axiom Q_count_combine_append_2 :
  forall (Mint:addr -> Numbers.BinNums.Z) (a1:addr) (a2:addr) (out:addr)
    (size1:Numbers.BinNums.Z) (size2:Numbers.BinNums.Z),
  let x := Mint (shift out (size1 + size2)%Z) in
  let x1 := Mint (shift a2 size2) in
  (x = x1) -> (0%Z <= size1)%Z -> (0%Z <= size2)%Z -> is_sint32_chunk Mint ->
  is_sint32 x1 -> P_count_combine Mint a1 size1 a2 size2 out ->
  is_sint32 x -> P_count_combine Mint a1 size1 a2 (1%Z + size2)%Z out.

Axiom Q_count_combine_id :
  forall (Mint:addr -> Numbers.BinNums.Z) (a1:addr) (len1:Numbers.BinNums.Z)
    (len2:Numbers.BinNums.Z),
  (0%Z <= len1)%Z -> (0%Z <= len2)%Z -> is_sint32_chunk Mint ->
  P_count_combine Mint a1 len1 (shift a1 len1) len2 a1.

Axiom Q_perm_eq :
  forall (Mint:addr -> Numbers.BinNums.Z) (Mint1:addr -> Numbers.BinNums.Z)
    (arr1:addr) (arr2:addr) (e:Numbers.BinNums.Z),
  is_sint32_chunk Mint -> is_sint32_chunk Mint1 ->
  P_same_array Mint Mint1 arr1 arr2 e -> P_permutation Mint Mint1 arr1 arr2 e.

(* Why3 assumption *)
Definition P_swapped (Mint:addr -> Numbers.BinNums.Z)
    (Mint1:addr -> Numbers.BinNums.Z) (p:addr) (q:addr) : Prop :=
  ((Mint p) = (Mint1 q)) /\ ((Mint q) = (Mint1 p)).

(* Why3 assumption *)
Definition P_array_elem_swapped (Mint:addr -> Numbers.BinNums.Z)
    (Mint1:addr -> Numbers.BinNums.Z) (arr:addr) (len:Numbers.BinNums.Z)
    (p:Numbers.BinNums.Z) (q:Numbers.BinNums.Z) : Prop :=
  ((((0%Z <= p)%Z /\ (p < q)%Z) /\ (q < len)%Z) /\
   P_swapped Mint Mint1 (shift arr p) (shift arr q)) /\
  (forall (i:Numbers.BinNums.Z),
   let a := shift arr i in
   ~ (p = i) -> ~ (q = i) -> (0%Z <= i)%Z -> (i < len)%Z ->
   ((Mint1 a) = (Mint a))).

Axiom Q_perm_swap :
  forall (Mint:addr -> Numbers.BinNums.Z) (Mint1:addr -> Numbers.BinNums.Z)
    (arr1:addr),
  is_sint32_chunk Mint -> is_sint32_chunk Mint1 ->
  P_array_elem_swapped Mint Mint1 arr1 2%Z 0%Z 1%Z ->
  P_permutation Mint Mint1 arr1 arr1 2%Z.

Axiom Q_perm_trans :
  forall (Mint:addr -> Numbers.BinNums.Z) (Mint1:addr -> Numbers.BinNums.Z)
    (Mint2:addr -> Numbers.BinNums.Z) (arr1:addr) (arr2:addr) (arr3:addr)
    (e:Numbers.BinNums.Z),
  is_sint32_chunk Mint -> is_sint32_chunk Mint2 -> is_sint32_chunk Mint1 ->
  P_permutation Mint Mint1 arr2 arr3 e ->
  P_permutation Mint1 Mint2 arr1 arr2 e ->
  P_permutation Mint Mint2 arr1 arr3 e.

Definition addr_eq_dec : forall (p q : addr), {p = q} + {p <> q}.
intros.
destruct p as [p1 p2].
destruct q as [q1 q2].
destruct (Z.eq_dec p1 q1); destruct (Z.eq_dec p2 q2); subst; auto.
all : constructor 2; intro; inversion H; auto.
Defined.

(* Why3 goal *)
Theorem wp_goal :
  forall (t:Numbers.BinNums.Z -> Numbers.BinNums.Z)
    (t1:addr -> Numbers.BinNums.Z) (t2:addr -> Numbers.BinNums.Z)
    (t3:addr -> Numbers.BinNums.Z) (a:addr) (a1:addr) (i:Numbers.BinNums.Z)
    (i1:Numbers.BinNums.Z) (i2:Numbers.BinNums.Z) (i3:Numbers.BinNums.Z)
    (i4:Numbers.BinNums.Z) (a2:addr),
  let x := (i1 + i3)%Z in
  let x1 := (i + i1)%Z in
  let x2 := (i3 + i4)%Z in
  let x3 := ((-1%Z)%Z * i1)%Z in
  let x4 := (i2 + x3)%Z in
  let a3 := shift a1 0%Z in
  let a4 := shift a 0%Z in
  let a5 := shift a2 0%Z in
  let a6 := shift a2 i2 in
  let a7 := havoc t3 t1 a5 x1 in
  let a8 := shift a x4 in
  let a9 := a7 (shift a i) in
  let a10 := a7 (shift a2 (((-1%Z)%Z + i)%Z + i1)%Z) in
  let a11 := shift a2 x1 in
  let x5 := ((-1%Z)%Z * i)%Z in
  let a12 := havoc t2 a7 a11 (((i3 + i4)%Z + x5)%Z + x3)%Z in
  let a13 := shift a2 ((-1%Z)%Z + i2)%Z in
  let a14 := a12 a8 in
  let a15 := map.Map.set a12 a6 a14 in
  let a16 := havoc t2 a7 a11 (i3 + x5)%Z in
  let x6 := ((1%Z + i2)%Z + x3)%Z in
  let a17 := shift a x6 in
  let a18 := a16 a8 in
  let a19 := map.Map.set a16 a6 a18 in
  (i1 <= i4)%Z -> (i <= i3)%Z -> (0%Z <= i1)%Z -> (i4 <= i1)%Z ->
  (0%Z <= i)%Z -> (i < i3)%Z -> (i2 < x)%Z -> (x1 <= i2)%Z -> (i2 <= x)%Z ->
  ((region (base a2)) <= 0%Z)%Z -> ((region (base a1)) <= 0%Z)%Z ->
  ((region (base a)) <= 0%Z)%Z -> (x2 <= 4294967295%Z)%Z ->
  is_sint32_chunk t1 -> linked t -> is_uint32 i4 -> is_uint32 i3 ->
  is_uint32 i2 -> is_uint32 i1 -> is_uint32 i -> P_sorted t1 a1 i4 ->
  P_sorted t1 a i3 -> is_uint32 x1 -> is_uint32 x4 ->
  is_sint32 (t1 (shift a2 (-1%Z)%Z)) -> is_sint32 (t1 a3) ->
  is_sint32 (t1 a4) -> valid_rd t a3 i4 -> valid_rd t a4 i3 ->
  valid_rw t a5 x2 -> valid_rw t a6 1%Z -> separated a5 x2 a3 i4 ->
  separated a5 x2 a4 i3 -> is_sint32_chunk a7 -> valid_rd t a8 1%Z ->
  is_sint32 (a7 (shift a1 i1)) -> is_sint32 a9 -> is_sint32 a10 ->
  P_sorted a7 a2 x1 -> is_sint32_chunk a12 ->
  P_count_combine a7 a i a1 i1 a2 -> is_sint32 (a12 a13) -> is_sint32 a14 ->
  is_sint32_chunk a15 -> P_sorted a16 a2 i2 -> is_sint32 (a15 a17) ->
  P_sorted a19 a2 (1%Z + i2)%Z -> P_count_combine a16 a x4 a1 i1 a2 ->
  P_same_array a19 a16 a2 a2 i2 -> P_same_array a19 a16 a1 a1 i1 ->
  P_same_array a19 a16 a a x4 -> ((0%Z < x1)%Z -> (a10 <= a9)%Z) ->
  ((0%Z < i2)%Z -> ((a16 a13) <= a18)%Z) ->
  (((2%Z + i2)%Z <= x)%Z -> (a18 <= (a19 a17))%Z) ->
  P_count_combine a19 a x6 a1 i1 a2.
(* Why3 intros t t1 t2 t3 a a1 i i1 i2 i3 i4 a2 x x1 x2 x3 x4 a3 a4 a5 a6 a7
        a8 a9 a10 a11 x5 a12 a13 a14 a15 a16 x6 a17 a18 a19 h1 h2 h3 h4 h5 h6
        h7 h8 h9 h10 h11 h12 h13 h14 h15 h16 h17 h18 h19 h20 h21 h22 h23 h24
        h25 h26 h27 h28 h29 h30 h31 h32 h33 h34 h35 h36 h37 h38 h39 h40 h41
        h42 h43 h44 h45 h46 h47 h48 h49 h50 h51 h52 h53 h54. *)
Proof.
Open Scope Z_scope.
Require Import Lia.
intros **.
(* The proof procedure here is similar to that of the first loop.
   Please go read that because I'm very tired and cannot explain
   what I am writing. *)

(* Let's give variables more meaningful name
   and make proof script work no matter what names are given by the tools. *)

(* Rename until the goal looks like
    P_count_combine mem' arr1 i_1 arr2 (1 + i_2) out. *)

rename a19 into mem';
rename a into arr_1;
rename a1 into arr_2;
rename i1 into i_2;
rename a2 into out.
subst x6.
subst x3.
rename i2 into i_out.
replace (1 + i_out + - (1) * i_2) with (1 + x4) by lia.
rename x4 into i_1.
(* Goal_last_iter is something with type
   P_count_combine a4 arr_1 i_1 arr_2 i_2 out. *)
rename H46 into goal_last_iter.
(* The type of foo_unchanged is P_permutation mem' mem foo 0 _ *)
rename a16 into mem.
rename H47 into out_unchanged.
rename H48 into arr_2_unchanged.
rename H49 into arr_1_unchanged.

(* mem' is mem after assignment. *)
assert (i_out = i_1 + i_2). { lia. }
subst a6.
subst a18.
subst a8.

assert (ZZ: (Map.set mem (shift out i_out) (mem (shift arr_1 i_1)) (shift arr_1 i_1))
        = (mem (shift arr_1 i_1)) ).
{  destruct (Map.set'def mem (shift out i_out) (mem (shift arr_1 i_1)) (shift arr_1 i_1))
    as [eq neq].
   destruct (addr_eq_dec (shift out i_out) (shift arr_1 i_1)); auto. }
  
(* With all renaming done begins the proof script... *)
apply Q_count_combine_append_1; trivial; try lia.
- unfold mem'. rewrite ZZ. apply Map.set'def.
  replace (i_1 + i_2) with i_out by lia. trivial.
- Search is_sint32_chunk. admit. (* stuck *)
- unfold mem'. rewrite ZZ.
  unfold mem. admit.
- intros elem elem_i32.
  apply Q_perm_eq in out_unchanged.
  apply Q_perm_eq in arr_1_unchanged.
  apply Q_perm_eq in arr_2_unchanged.
  replace (i_1 + i_2) with i_out by lia.
  rewrite <- out_unchanged.
  rewrite <- arr_2_unchanged.
  rewrite <- arr_1_unchanged.
  unfold P_count_combine in goal_last_iter.
  replace i_out with (i_1 + i_2).
  apply goal_last_iter. all: trivial.
  all : admit.
  
- unfold mem'. replace i_out with (i_1 + i_2).
  replace (Map.set mem (shift out (i_1 + i_2)) (mem (shift arr_1 i_1))
     (shift out (i_1 + i_2)))
  with (mem (shift arr_1 i_1)).
  admit.
  symmetry. apply Map.set'def. reflexivity.
Qed.
