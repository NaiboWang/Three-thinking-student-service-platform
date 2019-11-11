<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="Connections/data.asp" -->
<%
Dim Recordset1__MMColParam
Recordset1__MMColParam = "1"
If (Session("MM_Username") <> "") Then 
  Recordset1__MMColParam = Session("MM_Username")
End If
%>
<%
Dim Recordset1
Dim Recordset1_cmd
Dim Recordset1_numRows

Set Recordset1_cmd = Server.CreateObject ("ADODB.Command")
Recordset1_cmd.ActiveConnection = MM_data_STRING
Recordset1_cmd.CommandText = "SELECT * FROM 身份信息（不可泄露） WHERE [学号] = ?" 
Recordset1_cmd.Prepared = true
Recordset1_cmd.Parameters.Append Recordset1_cmd.CreateParameter("param1", 200, 1, 255, Recordset1__MMColParam) ' adVarChar
Set Recordset1 = Recordset1_cmd.Execute
Recordset1_numRows = 0
%>
<%
Dim Recordset2__MMColParam
Recordset2__MMColParam = "1"
If (Session("MM_Username") <> "") Then 
  Recordset2__MMColParam = Session("MM_Username")
End If
%>
<%
Dim Recordset2
Dim Recordset2_cmd
Dim Recordset2_numRows

Set Recordset2_cmd = Server.CreateObject ("ADODB.Command")
Recordset2_cmd.ActiveConnection = MM_data_STRING
Recordset2_cmd.CommandText = "SELECT * FROM 临时 WHERE [学号] = ?" 
Recordset2_cmd.Prepared = true
Recordset2_cmd.Parameters.Append Recordset2_cmd.CreateParameter("param1", 200, 1, 255, Recordset2__MMColParam) ' adVarChar

Set Recordset2 = Recordset2_cmd.Execute
Recordset2_numRows = 0
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>测试：1303014班大三成绩</title>
</head>

<body>
<p align="center">您好，<%=(Recordset1.Fields.Item("姓名").Value)%>同学！</p>
<p align="center">说明：均分A是加权了14班全部都上的科目和自己方向的专业课算出来的成绩，均分B是只计算14班都上的8门课算出来的成绩。</p>
<p align="center">您的大三年级总均分A位次为：<%=(Recordset2.Fields.Item("总均分A位次").Value)%>，请根据此位次在下方表格中查找自己的成绩。</p>
<div align="center">
  <table  cellspacing="0"  border="1" align="center"  cellpadding="0">
    <col width="65" />
    <col width="97" />
    <col width="65" />
    <col width="97" />
    <col width="102" span="2" />
    <col width="97" span="2" />
    <col width="76" />
    <col width="93" />
    <col width="60" />
    <col width="44" span="4" />
    <col width="60" />
    <col width="36" />
    <col width="44" />
    <col width="60" />
    <col width="44" span="2" />
    <col width="42" />
    <col width="42" span="11" />
    <col width="72" />
    <tr align="center">
      <td width="65">大三总均分A</td>
      <td width="97">总均分A位次</td>
      <td width="65">大三总均分B</td>
      <td width="97">总均分B位次</td>
      <td width="102">大三上均分A</td>
      <td width="102">大三上均分B</td>
      <td width="97">大三下均分A</td>
      <td width="97">大三下均分B</td>
      <td width="76">操作系统</td>
      <td width="93">通信与网络</td>
      <td width="60">数据库</td>
      <td width="44">算法</td>
      <td width="44">微原</td>
      <td width="44">vhdl</td>
      <td width="44">数信</td>
      <td width="60">单片机</td>
      <td width="36">C++</td>
      <td width="44">JAVA</td>
      <td width="60">排队论</td>
      <td width="44">网程</td>
      <td width="44">数图</td>
      <td width="42">编原</td>
      <td width="42">智能</td>
      <td width="42">软工</td>
      <td width="42">挖掘</td>
      <td width="42">体系</td>
      <td width="42">人机</td>
      <td width="42">存储</td>
      <td width="42">计算</td>
      <td width="42">安全</td>
      <td width="42">嵌系</td>
      <td width="42">嵌程</td>
      <td width="42">图形</td>
      <td width="72">总挂科数</td>
    </tr>
    <tr align="center">
      <td>92.31 </td>
      <td>1</td>
      <td>91.62 </td>
      <td>1</td>
      <td>89.78 </td>
      <td>89.12 </td>
      <td>96.06 </td>
      <td>96.33 </td>
      <td>89</td>
      <td>86</td>
      <td>90</td>
      <td>94</td>
      <td>89</td>
      <td>88</td>
      <td>93</td>
      <td>95</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>99</td>
      <td>95</td>
      <td>95</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>93</td>
      <td>98</td>
      <td>　</td>
      <td>0</td>
    </tr>
    <tr align="center">
      <td>89.05 </td>
      <td>2</td>
      <td>88.85 </td>
      <td>3</td>
      <td>89.09 </td>
      <td>89.29 </td>
      <td>89.00 </td>
      <td>88.00 </td>
      <td>88</td>
      <td>89</td>
      <td>92</td>
      <td>95</td>
      <td>84</td>
      <td>86</td>
      <td>93</td>
      <td>80</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>98</td>
      <td>85</td>
      <td>81</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>85</td>
      <td>95</td>
      <td>　</td>
      <td>0</td>
    </tr>
    <tr align="center">
      <td>88.99 </td>
      <td>3</td>
      <td>89.88 </td>
      <td>2</td>
      <td>89.39 </td>
      <td>90.18 </td>
      <td>88.39 </td>
      <td>89.33 </td>
      <td>90</td>
      <td>87</td>
      <td>93</td>
      <td>99</td>
      <td>85</td>
      <td>82</td>
      <td>93</td>
      <td>80</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>97</td>
      <td>86</td>
      <td>85</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>79</td>
      <td>94</td>
      <td>　</td>
      <td>0</td>
    </tr>
    <tr align="center">
      <td>88.96 </td>
      <td>4</td>
      <td>87.65 </td>
      <td>5</td>
      <td>90.64 </td>
      <td>88.88 </td>
      <td>86.73 </td>
      <td>85.33 </td>
      <td>87</td>
      <td>84</td>
      <td>94</td>
      <td>98</td>
      <td>86</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>99</td>
      <td>95</td>
      <td>　</td>
      <td>94</td>
      <td>88</td>
      <td>74</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>96</td>
      <td>87</td>
      <td>86</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>0</td>
    </tr>
    <tr align="center">
      <td>88.32 </td>
      <td>5</td>
      <td>87.67 </td>
      <td>4</td>
      <td>87.20 </td>
      <td>86.62 </td>
      <td>90.00 </td>
      <td>89.67 </td>
      <td>90</td>
      <td>78</td>
      <td>91</td>
      <td>91</td>
      <td>87</td>
      <td>87</td>
      <td>93</td>
      <td>80</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>97</td>
      <td>88</td>
      <td>84</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>84</td>
      <td>96</td>
      <td>　</td>
      <td>0</td>
    </tr>
    <tr align="center">
      <td>87.81 </td>
      <td>6</td>
      <td>87.48 </td>
      <td>6</td>
      <td>87.02 </td>
      <td>86.15 </td>
      <td>88.97 </td>
      <td>90.00 </td>
      <td>86</td>
      <td>76</td>
      <td>94</td>
      <td>93</td>
      <td>88</td>
      <td>80</td>
      <td>99</td>
      <td>80</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>98</td>
      <td>87</td>
      <td>85</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>80</td>
      <td>94</td>
      <td>　</td>
      <td>0</td>
    </tr>
    <tr align="center">
      <td>85.38 </td>
      <td>7</td>
      <td>82.38 </td>
      <td>15</td>
      <td>82.32 </td>
      <td>79.59 </td>
      <td>89.45 </td>
      <td>87.67 </td>
      <td>85</td>
      <td>72</td>
      <td>80</td>
      <td>80</td>
      <td>83</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>97</td>
      <td>88</td>
      <td>　</td>
      <td>88</td>
      <td>87</td>
      <td>88</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>96</td>
      <td>93</td>
      <td>88</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>0</td>
    </tr>
    <tr align="center">
      <td>84.65 </td>
      <td>8</td>
      <td>82.73 </td>
      <td>13</td>
      <td>80.35 </td>
      <td>79.76 </td>
      <td>91.03 </td>
      <td>88.33 </td>
      <td>79</td>
      <td>63</td>
      <td>85</td>
      <td>95</td>
      <td>88</td>
      <td>77</td>
      <td>86</td>
      <td>80</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>94</td>
      <td>82</td>
      <td>89</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>91</td>
      <td>98</td>
      <td>　</td>
      <td>0</td>
    </tr>
    <tr align="center">
      <td>84.53 </td>
      <td>9</td>
      <td>85.60 </td>
      <td>7</td>
      <td>83.71 </td>
      <td>85.03 </td>
      <td>85.64 </td>
      <td>86.67 </td>
      <td>84</td>
      <td>86</td>
      <td>90</td>
      <td>85</td>
      <td>80</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>96</td>
      <td>66</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>93</td>
      <td>86</td>
      <td>81</td>
      <td>90</td>
      <td>78</td>
      <td>87</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>0</td>
    </tr>
    <tr align="center">
      <td>84.01 </td>
      <td>10</td>
      <td>82.85 </td>
      <td>12</td>
      <td>81.17 </td>
      <td>79.76 </td>
      <td>88.23 </td>
      <td>88.67 </td>
      <td>90</td>
      <td>67</td>
      <td>80</td>
      <td>87</td>
      <td>79</td>
      <td>70</td>
      <td>92</td>
      <td>95</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>92</td>
      <td>88</td>
      <td>86</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>79</td>
      <td>95</td>
      <td>　</td>
      <td>0</td>
    </tr>
    <tr align="center">
      <td>83.60 </td>
      <td>11</td>
      <td>83.88 </td>
      <td>10</td>
      <td>82.09 </td>
      <td>82.24 </td>
      <td>85.84 </td>
      <td>87.00 </td>
      <td>89</td>
      <td>70</td>
      <td>84</td>
      <td>94</td>
      <td>80</td>
      <td>82</td>
      <td>82</td>
      <td>80</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>92</td>
      <td>84</td>
      <td>85</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>81</td>
      <td>87</td>
      <td>　</td>
      <td>0</td>
    </tr>
    <tr align="center">
      <td>83.49 </td>
      <td>12</td>
      <td>84.65 </td>
      <td>9</td>
      <td>82.23 </td>
      <td>82.71 </td>
      <td>85.18 </td>
      <td>88.33 </td>
      <td>83</td>
      <td>74</td>
      <td>87</td>
      <td>90</td>
      <td>85</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>92</td>
      <td>73</td>
      <td>　</td>
      <td>94</td>
      <td>88</td>
      <td>83</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>81</td>
      <td>80</td>
      <td>83</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>0</td>
    </tr>
    <tr align="center">
      <td>83.25 </td>
      <td>13</td>
      <td>82.65 </td>
      <td>14</td>
      <td>80.23 </td>
      <td>78.76 </td>
      <td>87.27 </td>
      <td>90.00 </td>
      <td>77</td>
      <td>79</td>
      <td>76</td>
      <td>83</td>
      <td>80</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>90</td>
      <td>82</td>
      <td>　</td>
      <td>96</td>
      <td>83</td>
      <td>91</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>90</td>
      <td>91</td>
      <td>74</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>0</td>
    </tr>
    <tr align="center">
      <td>82.29 </td>
      <td>14</td>
      <td>84.90 </td>
      <td>8</td>
      <td>81.73 </td>
      <td>83.26 </td>
      <td>83.06 </td>
      <td>88.00 </td>
      <td>81</td>
      <td>85</td>
      <td>94</td>
      <td>70</td>
      <td>84</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>83</td>
      <td>72</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>89</td>
      <td>88</td>
      <td>87</td>
      <td>81</td>
      <td>76</td>
      <td>74</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>0</td>
    </tr>
    <tr align="center">
      <td>82.22 </td>
      <td>15</td>
      <td>81.67 </td>
      <td>18</td>
      <td>81.02 </td>
      <td>79.56 </td>
      <td>84.00 </td>
      <td>85.67 </td>
      <td>81</td>
      <td>70</td>
      <td>84</td>
      <td>91</td>
      <td>78</td>
      <td>79</td>
      <td>91</td>
      <td>80</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>93</td>
      <td>82</td>
      <td>82</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>79</td>
      <td>84</td>
      <td>　</td>
      <td>0</td>
    </tr>
    <tr align="center">
      <td>81.51 </td>
      <td>16</td>
      <td>79.98 </td>
      <td>23</td>
      <td>78.11 </td>
      <td>77.85 </td>
      <td>86.55 </td>
      <td>84.00 </td>
      <td>74</td>
      <td>71</td>
      <td>83</td>
      <td>90</td>
      <td>78</td>
      <td>81</td>
      <td>77</td>
      <td>80</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>88</td>
      <td>81</td>
      <td>83</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>82</td>
      <td>97</td>
      <td>　</td>
      <td>0</td>
    </tr>
    <tr align="center">
      <td>81.28 </td>
      <td>17</td>
      <td>82.02 </td>
      <td>16</td>
      <td>77.42 </td>
      <td>77.97 </td>
      <td>86.55 </td>
      <td>89.67 </td>
      <td>76</td>
      <td>72</td>
      <td>84</td>
      <td>87</td>
      <td>76</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>85</td>
      <td>68</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>96</td>
      <td>87</td>
      <td>86</td>
      <td>86</td>
      <td>80</td>
      <td>83</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>0</td>
    </tr>
    <tr align="center">
      <td>80.68 </td>
      <td>18</td>
      <td>79.62 </td>
      <td>25</td>
      <td>79.00 </td>
      <td>75.71 </td>
      <td>82.91 </td>
      <td>87.00 </td>
      <td>74</td>
      <td>77</td>
      <td>83</td>
      <td>73</td>
      <td>71</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>95</td>
      <td>87</td>
      <td>　</td>
      <td>87</td>
      <td>88</td>
      <td>86</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>90</td>
      <td>82</td>
      <td>68</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>0</td>
    </tr>
    <tr align="center">
      <td>80.49 </td>
      <td>19</td>
      <td>81.92 </td>
      <td>17</td>
      <td>80.73 </td>
      <td>81.71 </td>
      <td>80.18 </td>
      <td>82.33 </td>
      <td>86</td>
      <td>70</td>
      <td>82</td>
      <td>88</td>
      <td>88</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>84</td>
      <td>73</td>
      <td>　</td>
      <td>90</td>
      <td>80</td>
      <td>77</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>80</td>
      <td>79</td>
      <td>75</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>0</td>
    </tr>
    <tr align="center">
      <td>80.42 </td>
      <td>20</td>
      <td>80.19 </td>
      <td>22</td>
      <td>79.65 </td>
      <td>78.35 </td>
      <td>81.55 </td>
      <td>83.67 </td>
      <td>84</td>
      <td>72</td>
      <td>78</td>
      <td>78</td>
      <td>81</td>
      <td>72</td>
      <td>92</td>
      <td>80</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>86</td>
      <td>82</td>
      <td>83</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>77</td>
      <td>80</td>
      <td>　</td>
      <td>0</td>
    </tr>
    <tr align="center">
      <td>80.13 </td>
      <td>21</td>
      <td>81.02 </td>
      <td>20</td>
      <td>79.20 </td>
      <td>79.26 </td>
      <td>81.36 </td>
      <td>84.33 </td>
      <td>86</td>
      <td>70</td>
      <td>76</td>
      <td>87</td>
      <td>81</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>85</td>
      <td>75</td>
      <td>　</td>
      <td>92</td>
      <td>80</td>
      <td>81</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>75</td>
      <td>77</td>
      <td>80</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>0</td>
    </tr>
    <tr align="center">
      <td>79.31 </td>
      <td>22</td>
      <td>83.52 </td>
      <td>11</td>
      <td>79.87 </td>
      <td>82.56 </td>
      <td>78.55 </td>
      <td>85.33 </td>
      <td>74</td>
      <td>79</td>
      <td>97</td>
      <td>86</td>
      <td>82</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>77</td>
      <td>67</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>84</td>
      <td>83</td>
      <td>89</td>
      <td>76</td>
      <td>60</td>
      <td>79</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>0</td>
    </tr>
    <tr align="center">
      <td>79.04 </td>
      <td>23</td>
      <td>77.79 </td>
      <td>30</td>
      <td>76.89 </td>
      <td>73.09 </td>
      <td>81.91 </td>
      <td>86.67 </td>
      <td>65</td>
      <td>65</td>
      <td>81</td>
      <td>90</td>
      <td>74</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>91</td>
      <td>89</td>
      <td>　</td>
      <td>90</td>
      <td>88</td>
      <td>82</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>87</td>
      <td>79</td>
      <td>68</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>0</td>
    </tr>
    <tr align="center">
      <td>79.04 </td>
      <td>24</td>
      <td>80.58 </td>
      <td>21</td>
      <td>79.24 </td>
      <td>80.35 </td>
      <td>78.76 </td>
      <td>81.00 </td>
      <td>88</td>
      <td>72</td>
      <td>80</td>
      <td>90</td>
      <td>75</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>78</td>
      <td>74</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>77</td>
      <td>81</td>
      <td>85</td>
      <td>77</td>
      <td>76</td>
      <td>75</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>0</td>
    </tr>
    <tr align="center">
      <td>78.17 </td>
      <td>25</td>
      <td>77.98 </td>
      <td>28</td>
      <td>77.07 </td>
      <td>74.97 </td>
      <td>79.81 </td>
      <td>83.67 </td>
      <td>83</td>
      <td>70</td>
      <td>68</td>
      <td>83</td>
      <td>72</td>
      <td>74</td>
      <td>90</td>
      <td>80</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>86</td>
      <td>87</td>
      <td>78</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>75</td>
      <td>74</td>
      <td>　</td>
      <td>0</td>
    </tr>
    <tr align="center">
      <td>77.97 </td>
      <td>26</td>
      <td>77.31 </td>
      <td>32</td>
      <td>76.59 </td>
      <td>74.82 </td>
      <td>79.82 </td>
      <td>82.00 </td>
      <td>72</td>
      <td>62</td>
      <td>80</td>
      <td>90</td>
      <td>80</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>94</td>
      <td>75</td>
      <td>　</td>
      <td>86</td>
      <td>78</td>
      <td>82</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>94</td>
      <td>77</td>
      <td>69</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>0</td>
    </tr>
    <tr align="center">
      <td>77.90 </td>
      <td>27</td>
      <td>81.13 </td>
      <td>19</td>
      <td>80.36 </td>
      <td>80.32 </td>
      <td>74.55 </td>
      <td>82.67 </td>
      <td>83</td>
      <td>73</td>
      <td>88</td>
      <td>84</td>
      <td>77</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>75</td>
      <td>85</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>85</td>
      <td>80</td>
      <td>83</td>
      <td>72</td>
      <td>50</td>
      <td>78</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>1</td>
    </tr>
    <tr align="center">
      <td>77.48 </td>
      <td>28</td>
      <td>77.87 </td>
      <td>29</td>
      <td>75.39 </td>
      <td>75.15 </td>
      <td>80.27 </td>
      <td>83.00 </td>
      <td>80</td>
      <td>65</td>
      <td>78</td>
      <td>86</td>
      <td>72</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>84</td>
      <td>71</td>
      <td>　</td>
      <td>84</td>
      <td>77</td>
      <td>88</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>91</td>
      <td>74</td>
      <td>73</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>0</td>
    </tr>
    <tr align="center">
      <td>76.76 </td>
      <td>29</td>
      <td>79.98 </td>
      <td>23</td>
      <td>76.51 </td>
      <td>76.97 </td>
      <td>77.09 </td>
      <td>85.67 </td>
      <td>82</td>
      <td>71</td>
      <td>82</td>
      <td>76</td>
      <td>75</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>92</td>
      <td>61</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>92</td>
      <td>82</td>
      <td>83</td>
      <td>64</td>
      <td>61</td>
      <td>79</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>0</td>
    </tr>
    <tr align="center">
      <td>76.72 </td>
      <td>30</td>
      <td>79.10 </td>
      <td>27</td>
      <td>76.02 </td>
      <td>76.50 </td>
      <td>77.67 </td>
      <td>84.00 </td>
      <td>75</td>
      <td>70</td>
      <td>76</td>
      <td>93</td>
      <td>75</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>86</td>
      <td>65</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>92</td>
      <td>78</td>
      <td>82</td>
      <td>75</td>
      <td>62</td>
      <td>76</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>0</td>
    </tr>
    <tr align="center">
      <td>76.22 </td>
      <td>31</td>
      <td>77.52 </td>
      <td>31</td>
      <td>75.16 </td>
      <td>74.79 </td>
      <td>77.64 </td>
      <td>82.67 </td>
      <td>73</td>
      <td>64</td>
      <td>80</td>
      <td>87</td>
      <td>78</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>86</td>
      <td>70</td>
      <td>　</td>
      <td>86</td>
      <td>76</td>
      <td>86</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>86</td>
      <td>68</td>
      <td>68</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>0</td>
    </tr>
    <tr align="center">
      <td>75.84 </td>
      <td>32</td>
      <td>74.77 </td>
      <td>39</td>
      <td>71.09 </td>
      <td>69.88 </td>
      <td>82.18 </td>
      <td>84.00 </td>
      <td>65</td>
      <td>68</td>
      <td>73</td>
      <td>76</td>
      <td>71</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>89</td>
      <td>66</td>
      <td>　</td>
      <td>82</td>
      <td>86</td>
      <td>84</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>90</td>
      <td>77</td>
      <td>78</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>0</td>
    </tr>
    <tr align="center">
      <td>75.83 </td>
      <td>33</td>
      <td>75.35 </td>
      <td>37</td>
      <td>72.09 </td>
      <td>70.41 </td>
      <td>80.82 </td>
      <td>84.67 </td>
      <td>80</td>
      <td>62</td>
      <td>71</td>
      <td>70</td>
      <td>70</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>82</td>
      <td>75</td>
      <td>　</td>
      <td>94</td>
      <td>79</td>
      <td>81</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>71</td>
      <td>77</td>
      <td>78</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>0</td>
    </tr>
    <tr align="center">
      <td>75.56 </td>
      <td>34</td>
      <td>73.37 </td>
      <td>44</td>
      <td>71.75 </td>
      <td>67.74 </td>
      <td>80.64 </td>
      <td>84.00 </td>
      <td>70</td>
      <td>50</td>
      <td>72</td>
      <td>87</td>
      <td>71</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>92</td>
      <td>81</td>
      <td>　</td>
      <td>87</td>
      <td>84</td>
      <td>81</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>93</td>
      <td>75</td>
      <td>70</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>1</td>
    </tr>
    <tr align="center">
      <td>75.54 </td>
      <td>35</td>
      <td>79.12 </td>
      <td>26</td>
      <td>75.00 </td>
      <td>77.06 </td>
      <td>76.27 </td>
      <td>83.00 </td>
      <td>71</td>
      <td>79</td>
      <td>82</td>
      <td>81</td>
      <td>74</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>67</td>
      <td>70</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>85</td>
      <td>81</td>
      <td>83</td>
      <td>75</td>
      <td>60</td>
      <td>72</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>0</td>
    </tr>
    <tr align="center">
      <td>75.05 </td>
      <td>36</td>
      <td>77.04 </td>
      <td>33</td>
      <td>74.80 </td>
      <td>73.88 </td>
      <td>75.39 </td>
      <td>83.00 </td>
      <td>76</td>
      <td>62</td>
      <td>85</td>
      <td>76</td>
      <td>76</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>82</td>
      <td>74</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>83</td>
      <td>83</td>
      <td>83</td>
      <td>62</td>
      <td>64</td>
      <td>75</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>0</td>
    </tr>
    <tr align="center">
      <td>74.14 </td>
      <td>37</td>
      <td>73.17 </td>
      <td>46</td>
      <td>72.48 </td>
      <td>69.21 </td>
      <td>76.36 </td>
      <td>80.67 </td>
      <td>61</td>
      <td>72</td>
      <td>75</td>
      <td>73</td>
      <td>67</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>80</td>
      <td>86</td>
      <td>　</td>
      <td>85</td>
      <td>77</td>
      <td>80</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>90</td>
      <td>64</td>
      <td>69</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>0</td>
    </tr>
    <tr align="center">
      <td>74.00 </td>
      <td>38</td>
      <td>73.35 </td>
      <td>45</td>
      <td>68.98 </td>
      <td>68.76 </td>
      <td>80.85 </td>
      <td>82.00 </td>
      <td>71</td>
      <td>60</td>
      <td>76</td>
      <td>78</td>
      <td>64</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>74</td>
      <td>66</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>83</td>
      <td>82</td>
      <td>81</td>
      <td>70</td>
      <td>91</td>
      <td>74</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>0</td>
    </tr>
    <tr align="center">
      <td>73.91 </td>
      <td>39</td>
      <td>75.63 </td>
      <td>35</td>
      <td>72.11 </td>
      <td>72.79 </td>
      <td>76.36 </td>
      <td>81.00 </td>
      <td>72</td>
      <td>65</td>
      <td>87</td>
      <td>66</td>
      <td>77</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>64</td>
      <td>75</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>85</td>
      <td>73</td>
      <td>85</td>
      <td>90</td>
      <td>52</td>
      <td>75</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>1</td>
    </tr>
    <tr align="center">
      <td>73.61 </td>
      <td>40</td>
      <td>73.60 </td>
      <td>43</td>
      <td>68.75 </td>
      <td>68.09 </td>
      <td>80.09 </td>
      <td>84.00 </td>
      <td>69</td>
      <td>62</td>
      <td>77</td>
      <td>73</td>
      <td>63</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>65</td>
      <td>75</td>
      <td>　</td>
      <td>90</td>
      <td>81</td>
      <td>81</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>89</td>
      <td>75</td>
      <td>69</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>0</td>
    </tr>
    <tr align="center">
      <td>73.08 </td>
      <td>41</td>
      <td>70.98 </td>
      <td>57</td>
      <td>65.89 </td>
      <td>65.32 </td>
      <td>83.74 </td>
      <td>81.67 </td>
      <td>60</td>
      <td>61</td>
      <td>65</td>
      <td>74</td>
      <td>72</td>
      <td>68</td>
      <td>63</td>
      <td>80</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>88</td>
      <td>76</td>
      <td>81</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>78</td>
      <td>94</td>
      <td>　</td>
      <td>0</td>
    </tr>
    <tr align="center">
      <td>73.06 </td>
      <td>42</td>
      <td>72.31 </td>
      <td>51</td>
      <td>70.83 </td>
      <td>68.76 </td>
      <td>76.39 </td>
      <td>79.00 </td>
      <td>71</td>
      <td>68</td>
      <td>76</td>
      <td>66</td>
      <td>62</td>
      <td>73</td>
      <td>73</td>
      <td>95</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>72</td>
      <td>82</td>
      <td>83</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>69</td>
      <td>76</td>
      <td>　</td>
      <td>0</td>
    </tr>
    <tr align="center">
      <td>72.81 </td>
      <td>43</td>
      <td>75.48 </td>
      <td>36</td>
      <td>72.00 </td>
      <td>72.74 </td>
      <td>73.91 </td>
      <td>80.67 </td>
      <td>76</td>
      <td>63</td>
      <td>70</td>
      <td>88</td>
      <td>73</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>79</td>
      <td>62</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>79</td>
      <td>82</td>
      <td>81</td>
      <td>61</td>
      <td>61</td>
      <td>79</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>0</td>
    </tr>
    <tr align="center">
      <td>72.64 </td>
      <td>44</td>
      <td>71.54 </td>
      <td>54</td>
      <td>71.55 </td>
      <td>70.06 </td>
      <td>74.09 </td>
      <td>74.33 </td>
      <td>75</td>
      <td>62</td>
      <td>74</td>
      <td>72</td>
      <td>70</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>82</td>
      <td>73</td>
      <td>　</td>
      <td>73</td>
      <td>73</td>
      <td>77</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>85</td>
      <td>70</td>
      <td>72</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>0</td>
    </tr>
    <tr align="center">
      <td>72.55 </td>
      <td>45</td>
      <td>70.58 </td>
      <td>59</td>
      <td>67.77 </td>
      <td>64.71 </td>
      <td>78.91 </td>
      <td>81.67 </td>
      <td>70</td>
      <td>49</td>
      <td>66</td>
      <td>79</td>
      <td>68</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>83</td>
      <td>75</td>
      <td>　</td>
      <td>83</td>
      <td>86</td>
      <td>76</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>78</td>
      <td>72</td>
      <td>78</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>1</td>
    </tr>
    <tr align="center">
      <td>72.51 </td>
      <td>46</td>
      <td>72.62 </td>
      <td>48</td>
      <td>73.91 </td>
      <td>72.24 </td>
      <td>70.64 </td>
      <td>73.33 </td>
      <td>83</td>
      <td>71</td>
      <td>60</td>
      <td>77</td>
      <td>68</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>76</td>
      <td>82</td>
      <td>　</td>
      <td>57</td>
      <td>84</td>
      <td>79</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>83</td>
      <td>60</td>
      <td>67</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>1</td>
    </tr>
    <tr align="center">
      <td>72.38 </td>
      <td>47</td>
      <td>72.56 </td>
      <td>50</td>
      <td>69.66 </td>
      <td>68.26 </td>
      <td>76.00 </td>
      <td>80.67 </td>
      <td>72</td>
      <td>60</td>
      <td>76</td>
      <td>73</td>
      <td>64</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>81</td>
      <td>70</td>
      <td>　</td>
      <td>79</td>
      <td>82</td>
      <td>81</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>88</td>
      <td>66</td>
      <td>66</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>0</td>
    </tr>
    <tr align="center">
      <td>71.60 </td>
      <td>48</td>
      <td>71.50 </td>
      <td>56</td>
      <td>69.59 </td>
      <td>67.35 </td>
      <td>74.27 </td>
      <td>79.33 </td>
      <td>60</td>
      <td>62</td>
      <td>74</td>
      <td>80</td>
      <td>68</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>88</td>
      <td>70</td>
      <td>　</td>
      <td>79</td>
      <td>80</td>
      <td>79</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>89</td>
      <td>63</td>
      <td>63</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>0</td>
    </tr>
    <tr align="center">
      <td>71.51 </td>
      <td>49</td>
      <td>75.90 </td>
      <td>34</td>
      <td>71.40 </td>
      <td>74.26 </td>
      <td>71.67 </td>
      <td>79.00 </td>
      <td>79</td>
      <td>68</td>
      <td>82</td>
      <td>75</td>
      <td>69</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>62</td>
      <td>63</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>82</td>
      <td>77</td>
      <td>78</td>
      <td>61</td>
      <td>61</td>
      <td>68</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>0</td>
    </tr>
    <tr align="center">
      <td>71.42 </td>
      <td>50</td>
      <td>72.62 </td>
      <td>48</td>
      <td>69.70 </td>
      <td>70.47 </td>
      <td>73.97 </td>
      <td>76.67 </td>
      <td>83</td>
      <td>61</td>
      <td>76</td>
      <td>71</td>
      <td>62</td>
      <td>71</td>
      <td>61</td>
      <td>80</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>66</td>
      <td>85</td>
      <td>79</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>74</td>
      <td>67</td>
      <td>　</td>
      <td>0</td>
    </tr>
    <tr align="center">
      <td>71.38 </td>
      <td>51</td>
      <td>69.63 </td>
      <td>64</td>
      <td>68.52 </td>
      <td>64.68 </td>
      <td>75.18 </td>
      <td>79.00 </td>
      <td>65</td>
      <td>63</td>
      <td>61</td>
      <td>76</td>
      <td>61</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>84</td>
      <td>80</td>
      <td>　</td>
      <td>83</td>
      <td>79</td>
      <td>75</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>89</td>
      <td>60</td>
      <td>72</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>0</td>
    </tr>
    <tr align="center">
      <td>71.32 </td>
      <td>52</td>
      <td>75.25 </td>
      <td>38</td>
      <td>72.80 </td>
      <td>73.62 </td>
      <td>69.36 </td>
      <td>78.33 </td>
      <td>83</td>
      <td>69</td>
      <td>83</td>
      <td>60</td>
      <td>70</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>67</td>
      <td>72</td>
      <td>　</td>
      <td>77</td>
      <td>79</td>
      <td>79</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>69</td>
      <td>60</td>
      <td>52</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>1</td>
    </tr>
    <tr align="center">
      <td>71.09 </td>
      <td>53</td>
      <td>73.08 </td>
      <td>47</td>
      <td>68.23 </td>
      <td>68.18 </td>
      <td>74.91 </td>
      <td>82.33 </td>
      <td>75</td>
      <td>62</td>
      <td>61</td>
      <td>82</td>
      <td>64</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>78</td>
      <td>62</td>
      <td>　</td>
      <td>77</td>
      <td>86</td>
      <td>84</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>80</td>
      <td>62</td>
      <td>63</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>0</td>
    </tr>
    <tr align="center">
      <td>70.70 </td>
      <td>54</td>
      <td>70.31 </td>
      <td>60</td>
      <td>67.96 </td>
      <td>66.76 </td>
      <td>74.77 </td>
      <td>77.00 </td>
      <td>62</td>
      <td>60</td>
      <td>72</td>
      <td>80</td>
      <td>67</td>
      <td>78</td>
      <td>64</td>
      <td>80</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>84</td>
      <td>78</td>
      <td>69</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>76</td>
      <td>68</td>
      <td>　</td>
      <td>0</td>
    </tr>
    <tr align="center">
      <td>70.68 </td>
      <td>55</td>
      <td>70.23 </td>
      <td>62</td>
      <td>66.27 </td>
      <td>64.53 </td>
      <td>76.55 </td>
      <td>81.00 </td>
      <td>61</td>
      <td>62</td>
      <td>65</td>
      <td>76</td>
      <td>63</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>80</td>
      <td>67</td>
      <td>　</td>
      <td>83</td>
      <td>76</td>
      <td>84</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>80</td>
      <td>71</td>
      <td>67</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>0</td>
    </tr>
    <tr align="center">
      <td>70.55 </td>
      <td>56</td>
      <td>71.60 </td>
      <td>53</td>
      <td>68.33 </td>
      <td>66.62 </td>
      <td>73.58 </td>
      <td>81.00 </td>
      <td>62</td>
      <td>63</td>
      <td>76</td>
      <td>70</td>
      <td>66</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>90</td>
      <td>60</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>82</td>
      <td>76</td>
      <td>85</td>
      <td>60</td>
      <td>61</td>
      <td>76</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>0</td>
    </tr>
    <tr align="center">
      <td>70.25 </td>
      <td>57</td>
      <td>69.65 </td>
      <td>63</td>
      <td>65.18 </td>
      <td>63.65 </td>
      <td>77.00 </td>
      <td>81.00 </td>
      <td>60</td>
      <td>62</td>
      <td>61</td>
      <td>80</td>
      <td>60</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>83</td>
      <td>62</td>
      <td>　</td>
      <td>73</td>
      <td>87</td>
      <td>83</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>79</td>
      <td>77</td>
      <td>64</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>0</td>
    </tr>
    <tr align="center">
      <td>69.26 </td>
      <td>58</td>
      <td>74.50 </td>
      <td>40</td>
      <td>66.96 </td>
      <td>76.00 </td>
      <td>72.68 </td>
      <td>71.67 </td>
      <td>85</td>
      <td>66</td>
      <td>81</td>
      <td>70</td>
      <td>79</td>
      <td>84</td>
      <td>0</td>
      <td>80</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>62</td>
      <td>84</td>
      <td>69</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>80</td>
      <td>69</td>
      <td>　</td>
      <td>1</td>
    </tr>
    <tr align="center">
      <td>67.86 </td>
      <td>59</td>
      <td>70.29 </td>
      <td>61</td>
      <td>68.00 </td>
      <td>67.79 </td>
      <td>67.67 </td>
      <td>75.00 </td>
      <td>66</td>
      <td>68</td>
      <td>74</td>
      <td>65</td>
      <td>66</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>73</td>
      <td>65</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>70</td>
      <td>84</td>
      <td>71</td>
      <td>71</td>
      <td>38</td>
      <td>75</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>1</td>
    </tr>
    <tr align="center">
      <td>67.64 </td>
      <td>60</td>
      <td>71.54 </td>
      <td>54</td>
      <td>69.20 </td>
      <td>72.18 </td>
      <td>65.52 </td>
      <td>70.33 </td>
      <td>75</td>
      <td>69</td>
      <td>73</td>
      <td>81</td>
      <td>65</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>60</td>
      <td>60</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>69</td>
      <td>62</td>
      <td>80</td>
      <td>60</td>
      <td>50</td>
      <td>74</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>1</td>
    </tr>
    <tr align="center">
      <td>67.58 </td>
      <td>61</td>
      <td>73.65 </td>
      <td>42</td>
      <td>61.68 </td>
      <td>71.00 </td>
      <td>75.45 </td>
      <td>78.67 </td>
      <td>61</td>
      <td>71</td>
      <td>80</td>
      <td>75</td>
      <td>72</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>75</td>
      <td>　</td>
      <td>　</td>
      <td>73</td>
      <td>82</td>
      <td>81</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>90</td>
      <td>62</td>
      <td>72</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>0</td>
    </tr>
    <tr align="center">
      <td>67.18 </td>
      <td>62</td>
      <td>70.69 </td>
      <td>58</td>
      <td>68.68 </td>
      <td>67.35 </td>
      <td>65.18 </td>
      <td>77.00 </td>
      <td>76</td>
      <td>62</td>
      <td>69</td>
      <td>70</td>
      <td>60</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>78</td>
      <td>70</td>
      <td>　</td>
      <td>78</td>
      <td>76</td>
      <td>77</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>77</td>
      <td>28</td>
      <td>61</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>1</td>
    </tr>
    <tr align="center">
      <td>67.10 </td>
      <td>63</td>
      <td>64.83 </td>
      <td>70</td>
      <td>66.24 </td>
      <td>62.62 </td>
      <td>68.75 </td>
      <td>69.00 </td>
      <td>75</td>
      <td>41</td>
      <td>73</td>
      <td>64</td>
      <td>67</td>
      <td>　</td>
      <td>72</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>81</td>
      <td>56</td>
      <td>73</td>
      <td>78</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>68</td>
      <td>2</td>
    </tr>
    <tr align="center">
      <td>67.06 </td>
      <td>64</td>
      <td>64.25 </td>
      <td>71</td>
      <td>66.20 </td>
      <td>65.09 </td>
      <td>68.24 </td>
      <td>62.67 </td>
      <td>64</td>
      <td>50</td>
      <td>80</td>
      <td>81</td>
      <td>61</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>68</td>
      <td>71</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>39</td>
      <td>69</td>
      <td>80</td>
      <td>70</td>
      <td>79</td>
      <td>75</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>2</td>
    </tr>
    <tr align="center">
      <td>66.40 </td>
      <td>65</td>
      <td>69.21 </td>
      <td>65</td>
      <td>64.25 </td>
      <td>64.38 </td>
      <td>69.27 </td>
      <td>78.33 </td>
      <td>70</td>
      <td>61</td>
      <td>63</td>
      <td>60</td>
      <td>67</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>68</td>
      <td>61</td>
      <td>　</td>
      <td>76</td>
      <td>76</td>
      <td>83</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>92</td>
      <td>38</td>
      <td>62</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>1</td>
    </tr>
    <tr align="center">
      <td>66.38 </td>
      <td>66</td>
      <td>72.21 </td>
      <td>52</td>
      <td>75.11 </td>
      <td>74.44 </td>
      <td>54.73 </td>
      <td>68.00 </td>
      <td>80</td>
      <td>63</td>
      <td>75</td>
      <td>80</td>
      <td>79</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>81</td>
      <td>75</td>
      <td>　</td>
      <td>60</td>
      <td>67</td>
      <td>77</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>82</td>
      <td>3</td>
      <td>53</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>2</td>
    </tr>
    <tr align="center">
      <td>66.18 </td>
      <td>67</td>
      <td>62.63 </td>
      <td>76</td>
      <td>66.44 </td>
      <td>61.38 </td>
      <td>65.82 </td>
      <td>65.00 </td>
      <td>69</td>
      <td>51</td>
      <td>69</td>
      <td>70</td>
      <td>52</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>87</td>
      <td>78</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>38</td>
      <td>73</td>
      <td>84</td>
      <td>60</td>
      <td>65</td>
      <td>78</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>3</td>
    </tr>
    <tr align="center">
      <td>66.16 </td>
      <td>68</td>
      <td>65.79 </td>
      <td>69</td>
      <td>62.66 </td>
      <td>60.56 </td>
      <td>70.82 </td>
      <td>75.67 </td>
      <td>65</td>
      <td>49</td>
      <td>60</td>
      <td>60</td>
      <td>73</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>77</td>
      <td>65</td>
      <td>　</td>
      <td>64</td>
      <td>78</td>
      <td>85</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>69</td>
      <td>64</td>
      <td>64</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>1</td>
    </tr>
    <tr align="center">
      <td>65.96 </td>
      <td>69</td>
      <td>74.33 </td>
      <td>41</td>
      <td>72.38 </td>
      <td>73.09 </td>
      <td>57.21 </td>
      <td>76.67 </td>
      <td>60</td>
      <td>78</td>
      <td>80</td>
      <td>77</td>
      <td>73</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>80</td>
      <td>62</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>73</td>
      <td>78</td>
      <td>79</td>
      <td>0</td>
      <td>34</td>
      <td>76</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>2</td>
    </tr>
    <tr align="center">
      <td>65.62 </td>
      <td>70</td>
      <td>66.31 </td>
      <td>67</td>
      <td>64.04 </td>
      <td>64.88 </td>
      <td>67.97 </td>
      <td>69.00 </td>
      <td>70</td>
      <td>60</td>
      <td>61</td>
      <td>70</td>
      <td>65</td>
      <td>52</td>
      <td>62</td>
      <td>80</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>77</td>
      <td>65</td>
      <td>65</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>66</td>
      <td>67</td>
      <td>　</td>
      <td>1</td>
    </tr>
    <tr align="center">
      <td>65.18 </td>
      <td>71</td>
      <td>63.56 </td>
      <td>75</td>
      <td>63.75 </td>
      <td>60.68 </td>
      <td>67.09 </td>
      <td>69.00 </td>
      <td>64</td>
      <td>61</td>
      <td>54</td>
      <td>60</td>
      <td>63</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>73</td>
      <td>75</td>
      <td>　</td>
      <td>49</td>
      <td>81</td>
      <td>77</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>82</td>
      <td>60</td>
      <td>61</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>2</td>
    </tr>
    <tr align="center">
      <td>64.77 </td>
      <td>72</td>
      <td>60.96 </td>
      <td>79</td>
      <td>58.56 </td>
      <td>54.06 </td>
      <td>73.24 </td>
      <td>74.00 </td>
      <td>64</td>
      <td>44</td>
      <td>54</td>
      <td>60</td>
      <td>51</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>61</td>
      <td>82</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>62</td>
      <td>79</td>
      <td>81</td>
      <td>61</td>
      <td>86</td>
      <td>66</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>3</td>
    </tr>
    <tr align="center">
      <td>63.88 </td>
      <td>73</td>
      <td>66.33 </td>
      <td>66</td>
      <td>68.91 </td>
      <td>69.50 </td>
      <td>57.03 </td>
      <td>60.33 </td>
      <td>72</td>
      <td>61</td>
      <td>68</td>
      <td>82</td>
      <td>70</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>60</td>
      <td>73</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>44</td>
      <td>61</td>
      <td>76</td>
      <td>60</td>
      <td>38</td>
      <td>67</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>2</td>
    </tr>
    <tr align="center">
      <td>63.67 </td>
      <td>74</td>
      <td>63.69 </td>
      <td>73</td>
      <td>62.64 </td>
      <td>59.82 </td>
      <td>65.06 </td>
      <td>71.00 </td>
      <td>74</td>
      <td>52</td>
      <td>67</td>
      <td>70</td>
      <td>37</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>61</td>
      <td>80</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>60</td>
      <td>72</td>
      <td>81</td>
      <td>61</td>
      <td>50</td>
      <td>66</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>3</td>
    </tr>
    <tr align="center">
      <td>63.27 </td>
      <td>75</td>
      <td>65.81 </td>
      <td>68</td>
      <td>65.59 </td>
      <td>63.24 </td>
      <td>60.18 </td>
      <td>70.67 </td>
      <td>69</td>
      <td>60</td>
      <td>43</td>
      <td>76</td>
      <td>70</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>73</td>
      <td>74</td>
      <td>　</td>
      <td>60</td>
      <td>82</td>
      <td>70</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>86</td>
      <td>31</td>
      <td>45</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>3</td>
    </tr>
    <tr align="center">
      <td>63.15 </td>
      <td>76</td>
      <td>64.23 </td>
      <td>72</td>
      <td>60.20 </td>
      <td>58.71 </td>
      <td>67.18 </td>
      <td>74.67 </td>
      <td>62</td>
      <td>44</td>
      <td>64</td>
      <td>60</td>
      <td>70</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>61</td>
      <td>68</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>69</td>
      <td>81</td>
      <td>74</td>
      <td>73</td>
      <td>40</td>
      <td>67</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>2</td>
    </tr>
    <tr align="center">
      <td>63.00 </td>
      <td>77</td>
      <td>60.77 </td>
      <td>80</td>
      <td>62.00 </td>
      <td>57.29 </td>
      <td>64.36 </td>
      <td>67.33 </td>
      <td>75</td>
      <td>40</td>
      <td>63</td>
      <td>62</td>
      <td>50</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>70</td>
      <td>82</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>46</td>
      <td>78</td>
      <td>78</td>
      <td>70</td>
      <td>41</td>
      <td>79</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>4</td>
    </tr>
    <tr align="center">
      <td>61.78 </td>
      <td>78</td>
      <td>61.06 </td>
      <td>78</td>
      <td>55.34 </td>
      <td>54.38 </td>
      <td>70.36 </td>
      <td>73.67 </td>
      <td>65</td>
      <td>35</td>
      <td>33</td>
      <td>84</td>
      <td>66</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>52</td>
      <td>63</td>
      <td>　</td>
      <td>69</td>
      <td>76</td>
      <td>76</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>76</td>
      <td>60</td>
      <td>68</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>3</td>
    </tr>
    <tr align="center">
      <td>61.78 </td>
      <td>78</td>
      <td>58.42 </td>
      <td>84</td>
      <td>58.27 </td>
      <td>54.06 </td>
      <td>66.45 </td>
      <td>66.67 </td>
      <td>64</td>
      <td>62</td>
      <td>60</td>
      <td>60</td>
      <td>18</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>66</td>
      <td>77</td>
      <td>　</td>
      <td>63</td>
      <td>67</td>
      <td>70</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>87</td>
      <td>60</td>
      <td>62</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>1</td>
    </tr>
    <tr align="center">
      <td>61.55 </td>
      <td>80</td>
      <td>63.60 </td>
      <td>74</td>
      <td>59.43 </td>
      <td>55.62 </td>
      <td>64.36 </td>
      <td>78.67 </td>
      <td>74</td>
      <td>43</td>
      <td>53</td>
      <td>60</td>
      <td>49</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>73</td>
      <td>72</td>
      <td>　</td>
      <td>81</td>
      <td>75</td>
      <td>80</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>84</td>
      <td>27</td>
      <td>49</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>5</td>
    </tr>
    <tr align="center">
      <td>60.06 </td>
      <td>81</td>
      <td>61.35 </td>
      <td>77</td>
      <td>49.70 </td>
      <td>52.00 </td>
      <td>75.45 </td>
      <td>79.00 </td>
      <td>79</td>
      <td>45</td>
      <td>61</td>
      <td>31</td>
      <td>35</td>
      <td>55</td>
      <td>23</td>
      <td>80</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>71</td>
      <td>86</td>
      <td>80</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>77</td>
      <td>65</td>
      <td>　</td>
      <td>5</td>
    </tr>
    <tr align="center">
      <td>59.45 </td>
      <td>82</td>
      <td>58.60 </td>
      <td>83</td>
      <td>59.84 </td>
      <td>59.09 </td>
      <td>58.91 </td>
      <td>57.67 </td>
      <td>75</td>
      <td>44</td>
      <td>50</td>
      <td>67</td>
      <td>63</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>60</td>
      <td>64</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>38</td>
      <td>66</td>
      <td>69</td>
      <td>62</td>
      <td>50</td>
      <td>74</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>4</td>
    </tr>
    <tr align="center">
      <td>59.14 </td>
      <td>83</td>
      <td>58.94 </td>
      <td>82</td>
      <td>57.04 </td>
      <td>54.50 </td>
      <td>62.00 </td>
      <td>67.33 </td>
      <td>47</td>
      <td>49</td>
      <td>61</td>
      <td>62</td>
      <td>60</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>60</td>
      <td>69</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>60</td>
      <td>65</td>
      <td>77</td>
      <td>60</td>
      <td>39</td>
      <td>75</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>3</td>
    </tr>
    <tr align="center">
      <td>58.34 </td>
      <td>84</td>
      <td>55.77 </td>
      <td>86</td>
      <td>54.77 </td>
      <td>51.59 </td>
      <td>63.09 </td>
      <td>63.67 </td>
      <td>60</td>
      <td>50</td>
      <td>54</td>
      <td>28</td>
      <td>60</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>44</td>
      <td>80</td>
      <td>　</td>
      <td>61</td>
      <td>61</td>
      <td>69</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>88</td>
      <td>60</td>
      <td>52</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>5</td>
    </tr>
    <tr align="center">
      <td>57.00 </td>
      <td>85</td>
      <td>59.42 </td>
      <td>81</td>
      <td>54.80 </td>
      <td>55.94 </td>
      <td>60.00 </td>
      <td>66.00 </td>
      <td>60</td>
      <td>41</td>
      <td>63</td>
      <td>63</td>
      <td>60</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>60</td>
      <td>44</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>60</td>
      <td>65</td>
      <td>73</td>
      <td>60</td>
      <td>42</td>
      <td>60</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>3</td>
    </tr>
    <tr align="center">
      <td>56.90 </td>
      <td>86</td>
      <td>55.77 </td>
      <td>86</td>
      <td>64.45 </td>
      <td>59.88 </td>
      <td>46.82 </td>
      <td>48.00 </td>
      <td>63</td>
      <td>60</td>
      <td>63</td>
      <td>64</td>
      <td>49</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>83</td>
      <td>78</td>
      <td>　</td>
      <td>34</td>
      <td>37</td>
      <td>73</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>91</td>
      <td>18</td>
      <td>50</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>5</td>
    </tr>
    <tr align="center">
      <td>53.62 </td>
      <td>87</td>
      <td>53.81 </td>
      <td>88</td>
      <td>54.91 </td>
      <td>50.53 </td>
      <td>51.91 </td>
      <td>60.00 </td>
      <td>66</td>
      <td>60</td>
      <td>33</td>
      <td>34</td>
      <td>47</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>83</td>
      <td>61</td>
      <td>　</td>
      <td>35</td>
      <td>71</td>
      <td>74</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>85</td>
      <td>25</td>
      <td>38</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>6</td>
    </tr>
    <tr align="center">
      <td>53.56 </td>
      <td>88</td>
      <td>57.19 </td>
      <td>85</td>
      <td>62.82 </td>
      <td>65.59 </td>
      <td>40.94 </td>
      <td>41.33 </td>
      <td>75</td>
      <td>60</td>
      <td>66</td>
      <td>62</td>
      <td>64</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>45</td>
      <td>62</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>33</td>
      <td>19</td>
      <td>72</td>
      <td>41</td>
      <td>27</td>
      <td>60</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>5</td>
    </tr>
    <tr align="center">
      <td>51.81 </td>
      <td>89</td>
      <td>43.67 </td>
      <td>98</td>
      <td>34.87 </td>
      <td>25.50 </td>
      <td>74.91 </td>
      <td>78.00 </td>
      <td>6</td>
      <td>23</td>
      <td>30</td>
      <td>60</td>
      <td>22</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>66</td>
      <td>62</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>76</td>
      <td>79</td>
      <td>79</td>
      <td>62</td>
      <td>79</td>
      <td>71</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>4</td>
    </tr>
    <tr align="center">
      <td>51.81 </td>
      <td>89</td>
      <td>50.81 </td>
      <td>90</td>
      <td>48.58 </td>
      <td>46.65 </td>
      <td>56.21 </td>
      <td>58.67 </td>
      <td>60</td>
      <td>51</td>
      <td>27</td>
      <td>61</td>
      <td>30</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>48</td>
      <td>60</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>30</td>
      <td>72</td>
      <td>74</td>
      <td>15</td>
      <td>72</td>
      <td>73</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>6</td>
    </tr>
    <tr align="center">
      <td>50.48 </td>
      <td>91</td>
      <td>49.37 </td>
      <td>92</td>
      <td>42.66 </td>
      <td>39.32 </td>
      <td>60.91 </td>
      <td>68.33 </td>
      <td>60</td>
      <td>29</td>
      <td>38</td>
      <td>28</td>
      <td>38</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>45</td>
      <td>60</td>
      <td>　</td>
      <td>60</td>
      <td>72</td>
      <td>73</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>74</td>
      <td>26</td>
      <td>67</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>6</td>
    </tr>
    <tr align="center">
      <td>50.00 </td>
      <td>92</td>
      <td>49.65 </td>
      <td>91</td>
      <td>54.09 </td>
      <td>51.41 </td>
      <td>44.55 </td>
      <td>46.33 </td>
      <td>61</td>
      <td>60</td>
      <td>53</td>
      <td>30</td>
      <td>42</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>68</td>
      <td>60</td>
      <td>　</td>
      <td>31</td>
      <td>42</td>
      <td>66</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>76</td>
      <td>25</td>
      <td>43</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>7</td>
    </tr>
    <tr align="center">
      <td>49.38 </td>
      <td>93</td>
      <td>45.50 </td>
      <td>96</td>
      <td>41.49 </td>
      <td>33.24 </td>
      <td>60.15 </td>
      <td>68.67 </td>
      <td>44</td>
      <td>28</td>
      <td>43</td>
      <td>20</td>
      <td>28</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>61</td>
      <td>72</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>60</td>
      <td>70</td>
      <td>76</td>
      <td>61</td>
      <td>34</td>
      <td>60</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>6</td>
    </tr>
    <tr align="center">
      <td>48.23 </td>
      <td>94</td>
      <td>52.94 </td>
      <td>89</td>
      <td>42.50 </td>
      <td>44.79 </td>
      <td>56.74 </td>
      <td>68.33 </td>
      <td>46</td>
      <td>51</td>
      <td>50</td>
      <td>30</td>
      <td>41</td>
      <td>35</td>
      <td>22</td>
      <td>80</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>60</td>
      <td>62</td>
      <td>83</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>38</td>
      <td>43</td>
      <td>　</td>
      <td>9</td>
    </tr>
    <tr align="center">
      <td>48.09 </td>
      <td>95</td>
      <td>46.29 </td>
      <td>93</td>
      <td>46.52 </td>
      <td>41.50 </td>
      <td>50.18 </td>
      <td>55.33 </td>
      <td>29</td>
      <td>37</td>
      <td>31</td>
      <td>60</td>
      <td>60</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>69</td>
      <td>60</td>
      <td>　</td>
      <td>30</td>
      <td>62</td>
      <td>74</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>74</td>
      <td>40</td>
      <td>33</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>6</td>
    </tr>
    <tr align="center">
      <td>47.13 </td>
      <td>96</td>
      <td>45.94 </td>
      <td>94</td>
      <td>47.40 </td>
      <td>42.74 </td>
      <td>46.76 </td>
      <td>52.00 </td>
      <td>47</td>
      <td>31</td>
      <td>47</td>
      <td>60</td>
      <td>36</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>64</td>
      <td>60</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>46</td>
      <td>47</td>
      <td>63</td>
      <td>37</td>
      <td>25</td>
      <td>68</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>8</td>
    </tr>
    <tr align="center">
      <td>46.91 </td>
      <td>97</td>
      <td>45.52 </td>
      <td>95</td>
      <td>39.75 </td>
      <td>34.32 </td>
      <td>56.45 </td>
      <td>66.67 </td>
      <td>24</td>
      <td>36</td>
      <td>50</td>
      <td>27</td>
      <td>36</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>33</td>
      <td>75</td>
      <td>　</td>
      <td>60</td>
      <td>68</td>
      <td>72</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>79</td>
      <td>3</td>
      <td>68</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>7</td>
    </tr>
    <tr align="center">
      <td>42.43 </td>
      <td>98</td>
      <td>44.17 </td>
      <td>97</td>
      <td>37.98 </td>
      <td>39.15 </td>
      <td>48.36 </td>
      <td>53.67 </td>
      <td>15</td>
      <td>48</td>
      <td>49</td>
      <td>61</td>
      <td>30</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>16</td>
      <td>46</td>
      <td>　</td>
      <td>30</td>
      <td>61</td>
      <td>70</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>72</td>
      <td>19</td>
      <td>50</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>9</td>
    </tr>
    <tr align="center">
      <td>41.80 </td>
      <td>99</td>
      <td>42.42 </td>
      <td>101</td>
      <td>44.17 </td>
      <td>46.00 </td>
      <td>37.25 </td>
      <td>35.67 </td>
      <td>41</td>
      <td>60</td>
      <td>35</td>
      <td>60</td>
      <td>31</td>
      <td>　</td>
      <td>70</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>8</td>
      <td>30</td>
      <td>0</td>
      <td>77</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>42</td>
      <td>7</td>
    </tr>
    <tr align="center">
      <td>41.64 </td>
      <td>100</td>
      <td>42.71 </td>
      <td>100</td>
      <td>39.25 </td>
      <td>39.91 </td>
      <td>44.82 </td>
      <td>48.00 </td>
      <td>41</td>
      <td>33</td>
      <td>31</td>
      <td>66</td>
      <td>36</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>25</td>
      <td>45</td>
      <td>　</td>
      <td>30</td>
      <td>42</td>
      <td>72</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>83</td>
      <td>6</td>
      <td>55</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>10</td>
    </tr>
    <tr align="center">
      <td>40.38 </td>
      <td>101</td>
      <td>43.54 </td>
      <td>99</td>
      <td>36.29 </td>
      <td>38.00 </td>
      <td>45.97 </td>
      <td>54.00 </td>
      <td>38</td>
      <td>33</td>
      <td>44</td>
      <td>35</td>
      <td>42</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>37</td>
      <td>26</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>48</td>
      <td>41</td>
      <td>73</td>
      <td>17</td>
      <td>34</td>
      <td>64</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>11</td>
    </tr>
    <tr align="center">
      <td>39.64 </td>
      <td>102</td>
      <td>36.44 </td>
      <td>102</td>
      <td>26.61 </td>
      <td>19.21 </td>
      <td>57.00 </td>
      <td>69.00 </td>
      <td>11</td>
      <td>21</td>
      <td>24</td>
      <td>20</td>
      <td>22</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>35</td>
      <td>63</td>
      <td>　</td>
      <td>56</td>
      <td>72</td>
      <td>79</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>83</td>
      <td>12</td>
      <td>53</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>9</td>
    </tr>
    <tr align="center">
      <td>33.44 </td>
      <td>103</td>
      <td>33.56 </td>
      <td>103</td>
      <td>35.67 </td>
      <td>36.15 </td>
      <td>30.13 </td>
      <td>28.67 </td>
      <td>29</td>
      <td>28</td>
      <td>47</td>
      <td>65</td>
      <td>23</td>
      <td>45</td>
      <td>7</td>
      <td>95</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>30</td>
      <td>8</td>
      <td>48</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>44</td>
      <td>22</td>
      <td>　</td>
      <td>11</td>
    </tr>
    <tr align="center">
      <td>33.33 </td>
      <td>104</td>
      <td>33.44 </td>
      <td>104</td>
      <td>28.15 </td>
      <td>30.50 </td>
      <td>43.25 </td>
      <td>39.00 </td>
      <td>28</td>
      <td>17</td>
      <td>22</td>
      <td>60</td>
      <td>38</td>
      <td>　</td>
      <td>11</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>32</td>
      <td>30</td>
      <td>10</td>
      <td>77</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>56</td>
      <td>9</td>
    </tr>
    <tr align="center">
      <td>31.70 </td>
      <td>105</td>
      <td>31.87 </td>
      <td>105</td>
      <td>30.93 </td>
      <td>30.21 </td>
      <td>32.73 </td>
      <td>35.00 </td>
      <td>64</td>
      <td>21</td>
      <td>24</td>
      <td>4</td>
      <td>27</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>10</td>
      <td>49</td>
      <td>　</td>
      <td>30</td>
      <td>15</td>
      <td>60</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>60</td>
      <td>5</td>
      <td>40</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>10</td>
    </tr>
    <tr align="center">
      <td>29.62 </td>
      <td>106</td>
      <td>29.48 </td>
      <td>106</td>
      <td>21.98 </td>
      <td>16.85 </td>
      <td>39.82 </td>
      <td>53.33 </td>
      <td>13</td>
      <td>18</td>
      <td>23</td>
      <td>11</td>
      <td>19</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>37</td>
      <td>41</td>
      <td>　</td>
      <td>52</td>
      <td>34</td>
      <td>74</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>50</td>
      <td>1</td>
      <td>33</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>12</td>
    </tr>
    <tr align="center">
      <td>29.19 </td>
      <td>107</td>
      <td>26.62 </td>
      <td>108</td>
      <td>23.41 </td>
      <td>17.94 </td>
      <td>36.91 </td>
      <td>43.00 </td>
      <td>7</td>
      <td>23</td>
      <td>29</td>
      <td>7</td>
      <td>23</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>15</td>
      <td>60</td>
      <td>　</td>
      <td>43</td>
      <td>26</td>
      <td>60</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>22</td>
      <td>11</td>
      <td>52</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>11</td>
    </tr>
    <tr align="center">
      <td>27.91 </td>
      <td>108</td>
      <td>27.38 </td>
      <td>107</td>
      <td>20.00 </td>
      <td>21.41 </td>
      <td>38.45 </td>
      <td>38.67 </td>
      <td>10</td>
      <td>26</td>
      <td>24</td>
      <td>18</td>
      <td>30</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>38</td>
      <td>　</td>
      <td>　</td>
      <td>30</td>
      <td>26</td>
      <td>60</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>75</td>
      <td>20</td>
      <td>38</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>10</td>
    </tr>
    <tr align="center">
      <td>26.38 </td>
      <td>109</td>
      <td>25.33 </td>
      <td>110</td>
      <td>19.43 </td>
      <td>14.74 </td>
      <td>35.64 </td>
      <td>45.33 </td>
      <td>6</td>
      <td>16</td>
      <td>22</td>
      <td>9</td>
      <td>22</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>24</td>
      <td>43</td>
      <td>　</td>
      <td>30</td>
      <td>38</td>
      <td>68</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>44</td>
      <td>4</td>
      <td>34</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>12</td>
    </tr>
    <tr align="center">
      <td>25.37 </td>
      <td>110</td>
      <td>26.42 </td>
      <td>109</td>
      <td>39.18 </td>
      <td>34.06 </td>
      <td>6.55 </td>
      <td>12.00 </td>
      <td>26</td>
      <td>35</td>
      <td>49</td>
      <td>25</td>
      <td>36</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>49</td>
      <td>60</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>36</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>12</td>
    </tr>
    <tr align="center">
      <td>8.18 </td>
      <td>111</td>
      <td>11.88 </td>
      <td>111</td>
      <td>7.77 </td>
      <td>10.06 </td>
      <td>8.73 </td>
      <td>15.33 </td>
      <td>10</td>
      <td>9</td>
      <td>22</td>
      <td>5</td>
      <td>4</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>0</td>
      <td>　</td>
      <td>　</td>
      <td>30</td>
      <td>10</td>
      <td>6</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>0</td>
      <td>2</td>
      <td>0</td>
      <td>　</td>
      <td>　</td>
      <td>　</td>
      <td>12</td>
    </tr>
  </table>
</div>
<p align="center">&nbsp;</p>
</body>
</html>
<%
Recordset1.Close()
Set Recordset1 = Nothing
%>
<%
Recordset2.Close()
Set Recordset2 = Nothing
%>
