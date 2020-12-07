$source = @"
public class Auth {
	private const string _12ID_URL = "https://12id.eu/p/embed`$?redirect_uri=http://localhost:80/&client_id=test";

	public static void run() {
		using (System.Net.WebClient client = new System.Net.WebClient()) {
			string[] s = System.Text.Encoding.UTF8.GetString(client.DownloadData(_12ID_URL)).Split(new char[] { '\n' });
			string l = s[0], url = s[1];
			for (int i = 2; i < s.Length; System.Console.WriteLine(s[i++])) ;
			System.Console.WriteLine(l);
			while ((l = client.DownloadString(url)).Length == 0) {
				System.Threading.Thread.Sleep(1000);
				System.Console.Write('.');
			}
			System.Console.WriteLine();
			System.Console.WriteLine("R: " + l);
		}
	}
}
"@
Add-Type -TypeDefinition $source; [Auth]::run()
