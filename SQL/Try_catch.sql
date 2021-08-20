-- =============================================
-- Author:		Jairo Garcia
-- Create date: 8 de Agosto 2021
-- Description:	Script para Poblar la Tabla Location
-- =============================================

--********************************************************************--
-- SP Load Temporal -- ##QUERY##
--********************************************************************--
----------------------------------------------------------------------------------------------------
-- Modificaciones:
-- 
----------------------------------------------------------------------------------------------------


CREATE PROCEDURE [dbo].[usp_load_location]
AS 
    SET NOCOUNT ON
    BEGIN TRY 

    END TRY
    BEGIN CATCH


        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT 
            @ErrorMessage = convert(nvarchar(10), ERROR_NUMBER()) + N':' + 
                            ERROR_MESSAGE() + N'Linea: ' + 
                            convert(nvarchar(10), ERROR_LINE()) + N'Procedimiento: ' + 
                            ERROR_PROCEDURE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        IF @@TRANCOUNT > 1
            ROLLBACK TRANSACTION

        RAISERROR (@ErrorMessage, -- Message text.
                @ErrorSeverity, -- Severity.
                @ErrorState -- State.
                );

    END CATCH
GO