USE EmpresaDB;
GO
CREATE TRIGGER trg_AuditarVenta
ON Ventas
AFTER INSERT
AS
BEGIN
    DECLARE @VentaID INT, @Producto VARCHAR(100), @Cantidad INT;
    DECLARE cur_Inserted CURSOR FOR SELECT VentaID, Producto, Cantidad FROM inserted;
    
    OPEN cur_Inserted;
    FETCH NEXT FROM cur_Inserted INTO @VentaID, @Producto, @Cantidad;
    
    WHILE @@FETCH_STATUS = 0
    BEGIN
        EXEC sp_RegistrarAuditoria @VentaID, @Producto, @Cantidad;
        FETCH NEXT FROM cur_Inserted INTO @VentaID, @Producto, @Cantidad;
    END;
    
    CLOSE cur_Inserted;
    DEALLOCATE cur_Inserted;
END;
GO