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
    
    public partial class Profissional
    {
        public Profissional()
        {
            this.Consulta = new HashSet<Consulta>();
        }
    
        public int Id { get; set; }
        public string Nome { get; set; }
    
        public virtual ICollection<Consulta> Consulta { get; set; }
    }
}
