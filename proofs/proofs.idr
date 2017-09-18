addingZeroChangesNothing: (n : Nat) -> n + 0 = n
addingZeroChangesNothing Z = Refl
addingZeroChangesNothing (S k) = cong {f=S} (addingZeroChangesNothing k)

