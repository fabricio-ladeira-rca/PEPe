//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Agendamento.DataAccessModel
{
    using System;
    using System.Collections.Generic;
    
    public partial class Agenda
    {
        public int Id { get; set; }
        public System.DateTime DataHora { get; set; }
        public int Usuario_Id { get; set; }
        public int Exame_Id { get; set; }
        public int Consulta_Id { get; set; }
    
        public virtual Consulta Consulta { get; set; }
        public virtual Exame Exame { get; set; }
        public virtual Usuario Usuario { get; set; }
    }
}