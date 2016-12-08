
package newpackage;

import java.io.*;
import java.net.*;
import java.util.*;
//jalanin reversal server baru ke reversal client
//2 arah
class Reversal extends Thread
{
    private Socket socket;
    private String client;

    
    Reversal(Socket s)
    {
        socket = s;
        client = s.getRemoteSocketAddress().toString();
        System.out.println("Incoming connection from "+ client);

    }
    public void run()
    {
        try //coba
        {
            BufferedReader in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
            PrintWriter out = new PrintWriter(socket.getOutputStream(),true);

            	String response=in.readLine();
            	if(response==null||response=="")
                {
            		//System.out.println("lolololol");
                }
            	else 
            	{
            		//System.out.println("wkwkwkkwkw");
            		System.out.println(response);
            	}
                
            
            
        }
        catch (IOException e)  //bagian kode yang dijalankan jika sukses
        {
            e.printStackTrace();
        }
        finally //bagian kode yang dijalan sukses maupun gagal
        {
            try //kenapa mesti ditry dan catch lagi supaya handling ioexception lagi
            {
                socket.close();
            }
            catch (IOException e)
            {
                e.printStackTrace();
            }
            System.out.println("Close connection from "+client);
        }
    }
}
public class ReversalServer
{
    public static void main (String[] args) throws IOException
    {
        try (ServerSocket listener = new ServerSocket(9090))
        {
            System.out.println("The server is running...");
            while (true)
            {
                Socket s = listener.accept();
                Thread t = new Reversal(s);
                t.start();
            }
        }
    }
}
