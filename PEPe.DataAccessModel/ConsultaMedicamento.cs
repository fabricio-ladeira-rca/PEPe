//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace PEPe.DataAccessModel
{
    using System;
    using System.Collections.Generic;
    
    public partial class ConsultaMedicamento
    {
        public int Id { get; set; }
        public int Medicamento_Id { get; set; }
        public int Consulta_Id { get; set; }
    
        public virtual Consulta Consulta { get; set; }
        public virtual Medicamento Medicamento { get; set; }
    }
}
