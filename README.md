# GnPairing

`GnPairing` is a Mathematica code for constructing Hamiltonian matrix of 
nuclear mean-field plus general pairing model.

After loading the code and supplying the number of orbits p, the quasi-spin S[i] of each orbit, the number of pairs k, the single-particle energy epsilon[i] of each orbit, and the pairing strength parameters G[i, j], the code generates the corresponding Hamiltonian matrix, provided that sufficient memory is available on the local machine. If insufficient memory is available, the code terminates automatically.


##Phase Fixing 

 An example of absolute phase fixing is applied after the eigenvectors of the Hamiltonian matrix have been obtained, as provided in the notebook file
`Example-including-phase-fixing.nb` 


## Files

| File | Description |
|------|-------------|
| `GnPairing-v1.5.2.wl` |  GnPairing code including phase fixing and Lanczos code for diagonalization|
| `exactPairingHS.m` | The package implementing the HS polynomial approach, which is used to generate reference data in the tests. |
| `Example-including-phase-fixing.nb` |A notebook file demonstrating an example that includes phase fixing|
| `Timing.nb` |Timing samples for the various cases shown in Tables I and II of the manuscript|

## Authors

- F. Pan, L. Dai, and J. P. Draayer, Sept. 10, 2026  
