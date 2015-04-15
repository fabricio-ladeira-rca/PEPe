using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Helper
{
    public class Library
    {
        public string crypt(string texto, string chave)
        {
            string TextoCrypt = string.Empty;
            string NovaSenha = string.Empty;
            int codigo1, codigo2;

            for (int x = 0; x <= (chave.Length-1); x++)
            {
                TextoCrypt = string.Empty;
                for (int y = 0; y <= (texto.Length-1); y++)
                {
                    codigo1 = (Int32)chave[x];
                    codigo2 = (Int32)texto[y];
                    TextoCrypt = TextoCrypt + (char)( codigo1 ^ codigo2);
                    //NovaSenha := NovaSenha + Chr((Ord(Chave[x]) xor Ord(Texto[y])));
                }
                texto = TextoCrypt;
            }

            return (TextoCrypt);
        }

    }
}
