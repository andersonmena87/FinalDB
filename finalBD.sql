CREATE OR REPLACE FUNCTION CALCULAR_CAJAS_NECESARIAS(ITEMS IN NUMBER,CAJAGRANDE IN NUMBER, CAJAPEQ  IN NUMBER)
    RETURN NUMBER
    AS
    
    TOTAL NUMBER(11,2):=0;
    TPM_ITEMS NUMBER:=0;
    ACUMCAJAGRANDE NUMBER:=0;
    ACUMCAJAPEQ NUMBER:=0;
    BEGIN
        TPM_ITEMS := ITEMS;
        IF TPM_ITEMS <= 0 THEN
            RETURN -1;
        ELSE
            for i in 1..CAJAGRANDE
            Loop
                IF TPM_ITEMS >= 5 THEN 
                    TPM_ITEMS := TPM_ITEMS - 5;
                    ACUMCAJAGRANDE := ACUMCAJAGRANDE + 1; 
                END IF; 
            End loop;
            
           IF TPM_ITEMS = 0 THEN 
                RETURN -1;
            ELSE
                for i in 1..CAJAPEQ
                Loop
                    IF TPM_ITEMS > 0 THEN 
                        TPM_ITEMS := TPM_ITEMS - 1;
                        ACUMCAJAPEQ := ACUMCAJAPEQ + 1;
                    END IF; 
                End loop;
           END IF;
           
           IF TPM_ITEMS = 0 THEN
                TOTAL := ACUMCAJAGRANDE + ACUMCAJAPEQ;
           ELSE
            RETURN -1;
           END IF;
        END IF;
        
      RETURN TOTAL;
    
END CALCULAR_CAJAS_NECESARIAS;

CREATE OR REPLACE FUNCTION LARGEST_SUM(a IN VARRAY)
RETURN NUMBER
AS 
 max_so_far number;
 curr_max number;
BEGIN
   max_so_far := a[0];
   curr_max := a[0];

    for i in 1..a.count 
    Loop
        curr_max = max(a[i], curr_max+a[i]);
        max_so_far = max(max_so_far, curr_max);
    End loop;

    return max_so_far;
END LARGEST_SUM; 