import sys
import re
import os

def parse_v8_dump(input_file, output_file):
    if not os.path.exists(input_file):
        print(f"Erro: Arquivo de entrada '{input_file}' não encontrado.")
        return

    with open(input_file, 'r') as f:
        lines = f.readlines()

    binary_data = bytearray()
    regex = re.compile(r"^\s*0x[0-9a-fA-F]+\s+\d+\s+([0-9a-fA-F]+)\s")

    lines_processed = 0
    
    for line in lines:
        match = regex.search(line)
        if match:
            hex_str = match.group(1).strip()
            try:
                # Converte a string hexadecimal contínua para bytes
                # Ex: "bba8" vira b'\xbb\xa8'
                bytes_list = bytearray.fromhex(hex_str)
                binary_data.extend(bytes_list)
                lines_processed += 1
            except ValueError:
                # Se pegar algo que parece hex mas não é par (ex: "abc"), ignora
                print(f"Aviso: Ignorando linha inválida ou ímpar: {hex_str}")
                continue

    # Cria diretório se não existir
    directory = os.path.dirname(output_file)
    if directory:
        os.makedirs(directory, exist_ok=True)

    with open(output_file, 'wb') as f:
        f.write(binary_data)
    
    print(f"--- Relatório ---")
    print(f"Arquivo gerado: {output_file}")
    print(f"Linhas de código processadas: {lines_processed}")
    print(f"Tamanho do binário: {len(binary_data)} bytes")
    
    if len(binary_data) == 0:
        print("ALERTA: O arquivo continua vazio. Verifique se o dump original contém exatamente o formato da imagem.")

if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Uso: python3 v8_to_bin.py <arquivo.asm> <saida.bin>")
    else:
        parse_v8_dump(sys.argv[1], sys.argv[2])
