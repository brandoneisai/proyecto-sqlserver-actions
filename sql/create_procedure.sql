USE EmpresaDB;
GO
CREATE PROCEDURE sp_RegistrarAuditoria
    @VentaID INT,
    @Producto VARCHAR(100),
    @Cantidad INT
AS
BEGIN
    INSERT INTO AuditoriaVentas(VentaID, Mensaje)
    VALUES(@VentaID, 'Venta registrada automáticamente');
    
    UPDATE Inventario
    SET Existencias = Existencias - @Cantidad
    WHERE Producto = @Producto;
END;
GO