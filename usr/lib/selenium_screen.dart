import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SeleniumScreen extends StatefulWidget {
  const SeleniumScreen({super.key});

  @override
  State<SeleniumScreen> createState() => _SeleniumScreenState();
}

class _SeleniumScreenState extends State<SeleniumScreen> {
  final List<Map<String, String>> snippets = [
    {
      'title': 'Setup Chrome WebDriver',
      'code': 'System.setProperty("webdriver.chrome.driver", "/path/to/chromedriver");\nWebDriver driver = new ChromeDriver();'
    },
    {
      'title': 'Open URL',
      'code': 'driver.get("https://www.google.com");'
    },
    {
      'title': 'Find Element by ID',
      'code': 'WebElement element = driver.findElement(By.id("search-box"));'
    },
    {
      'title': 'Find Element by XPath',
      'code': 'WebElement element = driver.findElement(By.xpath("//button[@name=\'submit\']"));'
    },
    {
      'title': 'Click Element',
      'code': 'element.click();'
    },
    {
      'title': 'Send Keys (Type text)',
      'code': 'element.sendKeys("Flutter Automation");'
    },
    {
      'title': 'Wait for Element (Explicit Wait)',
      'code': 'WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));\nWebElement element = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("result")));'
    },
    {
      'title': 'Handle Alert',
      'code': 'Alert alert = driver.switchTo().alert();\nalert.accept();'
    },
    {
      'title': 'Take Screenshot',
      'code': 'File srcFile = ((TakesScreenshot)driver).getScreenshotAs(OutputType.FILE);\nFileUtils.copyFile(srcFile, new File("./screenshot.png"));'
    },
    {
      'title': 'Close Browser',
      'code': 'driver.quit();'
    },
  ];

  void _copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Code copied to clipboard!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Java Selenium Snippets'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: snippets.length,
        itemBuilder: (context, index) {
          final snippet = snippets[index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 16.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        snippet['title']!,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.copy, size: 20),
                        tooltip: 'Copy Code',
                        onPressed: () => _copyToClipboard(snippet['code']!),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey[700]!),
                    ),
                    child: SelectableText(
                      snippet['code']!,
                      style: const TextStyle(
                        fontFamily: 'monospace',
                        color: Colors.lightGreenAccent,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
