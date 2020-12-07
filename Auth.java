package eu._12id.cli.test;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.Scanner;


public class Auth {
	private static final String _12ID_URL = "https://12id.eu/p/embed$?redirect_uri=http://localhost:80/&client_id=test";


	public static void main(final String[] args) {
		try (final Scanner s = new Scanner(new URL(_12ID_URL).openStream(), "UTF-8").useDelimiter("\\n")) {
			final String realm = s.hasNext() ? s.next() : null, url = s.hasNext() ? s.next() : null;
			while (s.hasNext()) {
				System.out.println(s.next());
			}
			System.out.println(realm);
			String l;
			while ((l = new BufferedReader(new InputStreamReader(new URL(url).openStream())).readLine()) == null) {
				Thread.sleep(1000);
				System.out.print('.');
			}

			System.out.println();
			System.out.println("R: " + l);
		} catch (final Exception e) {
			e.printStackTrace();
		}
	}
}
